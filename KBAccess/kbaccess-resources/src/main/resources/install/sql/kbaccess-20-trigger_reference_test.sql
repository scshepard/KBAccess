USE kbaccess;

DELIMITER $$
DROP TRIGGER IF EXISTS kbaccess.check_reference_test_before_insert$$
CREATE TRIGGER `check_reference_test_before_insert` BEFORE INSERT ON `reference_test`
FOR EACH ROW BEGIN
	IF ((SELECT `DEPTH` FROM `reference_depth` AS rd WHERE rd.ID_REFERENCE_DEPTH = NEW.ID_REFERENCE_DEPTH) <> '-1') THEN
		SET NEW.ID_REFERENCE_LEVEL = NULL;
		SET NEW.ID_REFERENCE = NULL;
		SET NEW.ID_REFERENCE_INFO = NULL;
	END IF;
END$$

DROP TRIGGER IF EXISTS kbaccess.check_reference_test_before_update$$
CREATE TRIGGER `check_reference_test_before_update` BEFORE UPDATE ON `reference_test`
FOR EACH ROW BEGIN
	IF ((SELECT `DEPTH` FROM `reference_depth` AS rd WHERE rd.ID_REFERENCE_DEPTH = NEW.ID_REFERENCE_DEPTH) <> '-1') THEN
		SET NEW.ID_REFERENCE_LEVEL = NULL;
		SET NEW.ID_REFERENCE = NULL;
		SET NEW.ID_REFERENCE_INFO = NULL;
	END IF;
END$$