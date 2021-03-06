-- SAK-38427

ALTER TABLE MFR_TOPIC_T ADD ALLOW_EMAIL_NOTIFICATIONS NUMBER(1,0) DEFAULT 1 NOT NULL;
ALTER TABLE MFR_TOPIC_T ADD INCLUDE_CONTENTS_IN_EMAILS NUMBER(1,0) DEFAULT 1 NOT NULL;

-- END SAK-38427

-- SAK-33969
ALTER TABLE MFR_OPEN_FORUM_T ADD RESTRICT_PERMS_FOR_GROUPS NUMBER(1) DEFAULT '0';
ALTER TABLE MFR_TOPIC_T ADD RESTRICT_PERMS_FOR_GROUPS NUMBER(1) DEFAULT '0';
-- SAK-33969

-- SAK-39967

CREATE INDEX contentreview_provider_id_idx on CONTENTREVIEW_ITEM (providerId, externalId);

-- End SAK-39967

-- SAK-40182
DECLARE
    seq_start INTEGER;
BEGIN
   SELECT NVL(MAX(PUBLISHEDSECTIONMETADATAID),0) + 1
   INTO   seq_start   FROM SAM_PUBLISHEDSECTIONMETADATA_T;
   EXECUTE IMMEDIATE 'CREATE SEQUENCE SAM_PUBSECTIONMETADATA_ID_S START WITH '||seq_start||' INCREMENT BY 1 NOMAXVALUE';
END;
-- End SAK-40182

-- SAK-41021
ALTER TABLE SIGNUP_TS_ATTENDEES ADD INSCRIPTION_TIME TIMESTAMP;

ALTER TABLE SIGNUP_TS_WAITINGLIST ADD INSCRIPTION_TIME TIMESTAMP;

-- END SAK-41021

-- SAK-40967
INSERT INTO SAKAI_REALM_FUNCTION VALUES (SAKAI_REALM_FUNCTION_SEQ.NEXTVAL, 'rubrics.evaluee');
INSERT INTO SAKAI_REALM_FUNCTION VALUES (SAKAI_REALM_FUNCTION_SEQ.NEXTVAL, 'rubrics.evaluator');
INSERT INTO SAKAI_REALM_FUNCTION VALUES (SAKAI_REALM_FUNCTION_SEQ.NEXTVAL, 'rubrics.associator');
INSERT INTO SAKAI_REALM_FUNCTION VALUES (SAKAI_REALM_FUNCTION_SEQ.NEXTVAL, 'rubrics.editor');

INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.user'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'access'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.user'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.associator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.user'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.editor'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.user'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.user'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));

INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'access'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.associator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.editor'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'maintain'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));

INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Student'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Instructor'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.associator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Instructor'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.editor'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Instructor'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Instructor'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Teaching Assistant'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluator'));
INSERT INTO SAKAI_REALM_RL_FN VALUES((select REALM_KEY from SAKAI_REALM where REALM_ID = '!site.template.course'), (select ROLE_KEY from SAKAI_REALM_ROLE where ROLE_NAME = 'Teaching Assistant'), (select FUNCTION_KEY from SAKAI_REALM_FUNCTION where FUNCTION_NAME = 'rubrics.evaluee'));

-- End SAK-40967

-- SAK-40721
ALTER TABLE BULLHORN_ALERTS ADD DEFERRED NUMBER(1) DEFAULT 0 NOT NULL;
-- END SAK-40721

-- SAK-41017

UPDATE SAKAI_SITE_PAGE SET layout = '0' WHERE page_id = '!error-100';
UPDATE SAKAI_SITE_PAGE SET layout = '0' WHERE page_id = '!urlError-100';

-- End of SAK-41017

-- SAK-33855 add settings for display of stats
ALTER TABLE gb_gradebook_t ADD assignment_stats_displayed NUMBER(1,0) DEFAULT '1' NOT NULL;
ALTER TABLE gb_gradebook_t ADD course_grade_stats_displayed NUMBER(1,0) DEFAULT '1' NOT NULL;
-- end SAK-33855

-- SAK-41225
DELETE FROM EMAIL_TEMPLATE_ITEM WHERE template_key = 'polls.notifyDeletedOption' AND template_locale='default';
-- End of SAK-41225

ALTER TABLE lti_tools
  ADD (allowfa_icon NUMBER(1) DEFAULT 0)
  ADD (allowlineitems NUMBER(1) DEFAULT 0)
  ADD (rolemap CLOB)
  ADD (lti13_client_id varchar2(1024) DEFAULT NULL)
  ADD (lti13_tool_public CLOB)
  ADD (lti13_tool_keyset CLOB)
  ADD (lti13_tool_kid varchar2(1024) DEFAULT NULL)
  ADD (lti13_tool_private CLOB)
  ADD (lti13_platform_public CLOB)
  ADD (lti13_platform_private CLOB)
  ADD (lti13_oidc_endpoint varchar2(1024) DEFAULT NULL)
  ADD (lti13_oidc_redirect varchar2(1024) DEFAULT NULL)
  ADD (lti11_launch_type NUMBER(1) DEFAULT 0);

ALTER TABLE lti_deploy ADD allowlineitems NUMBER(1) DEFAULT '0';
