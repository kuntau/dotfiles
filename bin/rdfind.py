#!/usr/bin/env python3

"""
Process `rdfind` result file
"""

import sys
import csv

FILENAME = sys.argv[1]


def bytes_to_readable(size_in_bytes):
    """covert size from bytes to human readable format"""
    # Convert the size to kilobytes (KB)
    size_in_kb = int(size_in_bytes) / 1024

    # Convert the size to megabytes (MB) if it is larger than 1 KB
    if size_in_kb > 1024:
        size_in_mb = size_in_kb / 1024

        # Convert the size to gigabytes (GB) if it is larger than 1 MB
        if size_in_mb > 1024:
            size_in_gb = size_in_mb / 1024
            return f"{size_in_gb:.2f} GB"
        return f"{size_in_mb:.2f} MB"
    return f"{size_in_kb:.2f} KB"


with open(FILENAME, "r", encoding="utf-8") as f:
    header = ["duptype", "id", "depth", "size",
              "device", "inode", "priority", "name"]

    dupes: dict[str, list[str]] = {}
    first_occurence: list[str] = []
    reader = csv.reader(f, delimiter=" ")

    for row in reader:
        if row[0] == "#":
            if row[1] == "duptype":
                print("Starting")
            elif row[1] == "end":
                print("End")
            else:
                print("Error: ", row)
        else:
            duptype, dup_id, depth, size, device, inode, priority, *name = row
            if row[0] == "DUPTYPE_FIRST_OCCURRENCE":
                # name = ' '.join(name)
                # print("FIRST OCCURRENCE", name, bytes_to_readable(size))
                first_occurence.append(dup_id)
                dupes[dup_id] = name
            elif row[0] == "DUPTYPE_WITHIN_SAME_TREE":
                dup_id = dup_id[1:]
                dupes[dup_id].append(name)

# for key, value in dupes.items():
#     print(key, value)

print("length of dupes: ", len(dupes))
print("length of [45]: ", len(dupes["45"]))
print("[45] ", dupes["45"])
print(len(first_occurence), first_occurence)
# Test the function
# print(bytes_to_readable(1024))  # Output: '1.00 KB'
# print(bytes_to_readable(1024 * 1024))  # Output: '1.00 MB'
# print(bytes_to_readable(1024 * 1024 * 10))  # Output: '10.00 MB'
# print(bytes_to_readable(1024 * 1024 * 1024))  # Output: '1.00 GB'
# print(bytes_to_readable(1024 * 1024 * 1024 * 10))  # Output: '10.00 GB'
