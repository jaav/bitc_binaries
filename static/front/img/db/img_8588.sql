BEGIN
DECLARE cur_val bigint(20);
DECLARE v_lock INT;
SELECT GET_LOCK(seq_name, 10) INTO v_lock;
SELECT sequence_cur_value INTO cur_val FROM sequence_data WHERE sequence_name = seq_name;
IF cur_val IS NOT NULL THEN
UPDATE sequence_data SET
sequence_cur_value = IF (
(sequence_cur_value + sequence_increment) > sequence_max_value,
IF (
sequence_cycle = TRUE,
sequence_min_value,
NULL
),
sequence_cur_value + sequence_increment
)
WHERE sequence_name = seq_name;
END IF;
SELECT RELEASE_LOCK(seq_name) INTO v_lock;
RETURN cur_val;
END

