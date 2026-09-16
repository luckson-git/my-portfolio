"""Rebuild the portable SQL import from the bundled CSV (Python standard library)."""
import csv
from pathlib import Path

root = Path(__file__).resolve().parents[1]
with (root / 'data/WA_Fn-UseC_-HR-Employee-Attrition.csv').open(encoding='utf-8-sig', newline='') as handle:
    rows = list(csv.DictReader(handle))
columns = list(rows[0])
text_columns = {'Attrition','BusinessTravel','Department','EducationField','Gender','JobRole','MaritalStatus','Over18','OverTime'}
assert len(columns) == 35 and len({r['EmployeeNumber'] for r in rows}) == len(rows)
values = []
for row in rows:
    assert all(v is not None and v.strip() for v in row.values())
    values.append('(' + ','.join("'" + row[c].replace("'", "''") + "'" if c in text_columns else str(int(row[c])) for c in columns) + ')')
sql = '-- Generated from the supplied CSV by scripts/generate_import.py.\n-- Portable INSERT import avoids LOCAL INFILE configuration.\nUSE hr_attrition_portfolio;\nSTART TRANSACTION;\nINSERT INTO employee_snapshot (' + ','.join('`'+c+'`' for c in columns) + ') VALUES\n' + ',\n'.join(values) + ';\nCOMMIT;\n'
(root / 'sql/02_import.sql').write_text(sql, encoding='utf-8')
print(f'Generated import for {len(rows)} rows.')
