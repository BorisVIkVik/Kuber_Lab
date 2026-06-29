import pyarrow as pa
import pyarrow.parquet as pq
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
file_path = BASE_DIR / "data" / "food.parquet"
out_path = BASE_DIR / "data" / "food_small.parquet"

pf = pq.ParquetFile(file_path)
chunks = []
n = 0

for batch in pf.iter_batches(batch_size=500):
    chunks.append(batch)
    n += batch.num_rows
    if n >= 1500:
        break

table = pa.Table.from_batches(chunks).slice(0, 1500)
pq.write_table(table, out_path)

print(f"Готово: {out_path}, строк: {table.num_rows}")