-- DEFAULT DATA
INSERT INTO users		SET id='bb686737-5080-11e9-809c-b827eb4f1633', pseudo='nmaitre', email='nicolas.maitre@cpnv.ch', first_name='Nicolas', last_name='Maitre', creation_time=CURRENT_TIMESTAMP(), active=1, enabled=1;
INSERT INTO users		SET id='f319ca59-5080-11e9-809c-b827eb4f1633', pseudo='nglassey', email='nicolas.glassey@cpnv.ch', first_name='Nicolas', last_name='Glassey', creation_time=CURRENT_TIMESTAMP(), active=1, enabled=1;
INSERT INTO friends		SET user_id_0="bb686737-5080-11e9-809c-b827eb4f1633", user_id_1="f319ca59-5080-11e9-809c-b827eb4f1633", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO groups 		SET id="0000-0000-0000-0000-0000", creation_time=CURRENT_TIMESTAMP(), name="Nicolas Maitre, Nicolas Glassey", type="private", active=1;
INSERT INTO user_groups SET users_id="bb686737-5080-11e9-809c-b827eb4f1633", groups_id="0000-0000-0000-0000-0000", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO user_groups SET users_id="f319ca59-5080-11e9-809c-b827eb4f1633", groups_id="0000-0000-0000-0000-0000", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO tokens 		SET id=UUID(), value='1234-1234-1234-1234-1234', type='session', expiration_time=0, active=1, user_id='bb686737-5080-11e9-809c-b827eb4f1633';
INSERT INTO tokens 		SET id=UUID(), value='2345-2345-2345-2345-2345', type='session', expiration_time=0, active=1, user_id='f319ca59-5080-11e9-809c-b827eb4f1633';
