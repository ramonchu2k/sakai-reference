-- SAK_41228
UPDATE CM_MEMBERSHIP_T SET USER_ID = LOWER(USER_ID);
UPDATE CM_ENROLLMENT_T SET USER_ID = LOWER(USER_ID);
UPDATE CM_OFFICIAL_INSTRUCTORS_T SET INSTRUCTOR_ID = LOWER(INSTRUCTOR_ID);
-- End of SAK_41228

-- SAK-41391

ALTER TABLE POLL_OPTION ADD OPTION_ORDER NUMBER(10,0);

-- END SAK-41391