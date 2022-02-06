
import re
lines = []

with open('s1_logs.txt') as f:
    lines.append(re.search(r'\d', f.readlines()))
    
print(lines[0:2])