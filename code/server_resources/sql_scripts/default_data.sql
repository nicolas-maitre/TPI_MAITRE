USE messaging_web_app_db
-- DEFAULT DATA
INSERT INTO users		SET id='0000-0000-0000-0000-0000', pseudo='nmaitre', email='nicolas.maitre@cpnv.ch', first_name='Nicolas', last_name='Maitre', creation_time=CURRENT_TIMESTAMP(), active=1, enabled=1;
INSERT INTO users		SET id='1111-1111-1111-1111-1111', pseudo='nglassey', email='nicolas.glassey@cpnv.ch', first_name='Nicolas', last_name='Glassey', creation_time=CURRENT_TIMESTAMP(), active=1, enabled=1;
INSERT INTO users		SET id='2222-2222-2222-2222-2222', pseudo='ggruaz', email='ggruaz@gmail.com', first_name='Gilbert', last_name='Gruaz', creation_time=CURRENT_TIMESTAMP(), active=1, enabled=1;
INSERT INTO users		SET id='3333-3333-3333-3333-3333', pseudo='jlagona', email='julien.lagona@gmail.com', first_name='Julien', last_name='Lagona', creation_time=CURRENT_TIMESTAMP(), active=1, enabled=1;

INSERT INTO friends		SET user_id_0="bb686737-5080-11e9-809c-b827eb4f1633", user_id_1="f319ca59-5080-11e9-809c-b827eb4f1633", creation_time=CURRENT_TIMESTAMP(), active=1;

--private
INSERT INTO groups 		SET id="0000-1111-2222-3333-4444", creation_time=CURRENT_TIMESTAMP(), name="Nicolas Maitre, Nicolas Glassey", type="private", active=1;
INSERT INTO user_groups SET users_id="0000-0000-0000-0000-0000", groups_id="0000-1111-2222-3333-4444", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO user_groups SET users_id="1111-1111-1111-1111-1111", groups_id="0000-1111-2222-3333-4444", creation_time=CURRENT_TIMESTAMP(), active=1;
--group
INSERT INTO groups 		SET id="5555-6666-7777-8888-9999", creation_time=CURRENT_TIMESTAMP(), name="Le groupe CPNV", type="group", active=1;
INSERT INTO user_groups SET users_id="0000-0000-0000-0000-0000", groups_id="5555-6666-7777-8888-9999", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO user_groups SET users_id="1111-1111-1111-1111-1111", groups_id="5555-6666-7777-8888-9999", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO user_groups SET users_id="2222-2222-2222-2222-2222", groups_id="5555-6666-7777-8888-9999", creation_time=CURRENT_TIMESTAMP(), active=1;
INSERT INTO user_groups SET users_id="3333-3333-3333-3333-3333", groups_id="5555-6666-7777-8888-9999", creation_time=CURRENT_TIMESTAMP(), active=1;

INSERT INTO tokens 		SET id=UUID(), value='1234-1234-1234-1234-1234', type='session', expiration_time=0, active=1, user_id='0000-0000-0000-0000-0000';
INSERT INTO tokens 		SET id=UUID(), value='2345-2345-2345-2345-2345', type='session', expiration_time=0, active=1, user_id='1111-1111-1111-1111-1111';
INSERT INTO tokens 		SET id=UUID(), value='3456-3456-3456-3456-3456', type='session', expiration_time=0, active=1, user_id='2222-2222-2222-2222-2222';
INSERT INTO tokens 		SET id=UUID(), value='4567-4567-4567-4567-4567', type='session', expiration_time=0, active=1, user_id='3333-3333-3333-3333-3333';
