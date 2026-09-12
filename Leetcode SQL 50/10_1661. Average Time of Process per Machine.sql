/*  Table: Activity

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |
+----------------+---------+
The table shows the user activities for a factory website.
(machine_id, process_id, activity_type) is the primary key (combination of columns with unique values) of this table.
machine_id is the ID of a machine.
process_id is the ID of a process running on the machine with ID machine_id.
activity_type is an ENUM (category) of type ('start', 'end').
timestamp is a float representing the current time in seconds.
'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.
The `start` timestamp will always be less than or equal to the `end` timestamp for every `(machine_id, process_id)` pair.
It is guaranteed that each (machine_id, process_id) pair has a 'start' and 'end' timestamp.*/

SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
    ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id
    AND a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY a.machine_id;
