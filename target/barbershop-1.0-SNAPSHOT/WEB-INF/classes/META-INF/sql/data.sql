INSERT INTO barbershop.barbershops (id, address, city, close, description, email, enabled, name, nip, open, password, phoneNumber, workInSaturdays) VALUES (1, 'Warszawska 123', 'Warszawa', '20', 'A barber is a person whose occupation is mainly to cut, dress, groom, style and shave men''s and boys'' hair. A barber''s place of work is known as a "barbershop" or a "barber''s". Barbershops are also places of social interaction and public discourse. In some instances, barbershops are also public forums. ', 'adam@gmail.com', true, 'Barbershop Mint', '5222661673', '8', '$2a$10$hi5Qn6kHMMIZ6dPWndnlfe6ERIAsyLPiLJq0WYkNCOjWMDnB6ST2a', '792004592', true);

INSERT INTO barbershop.user_role (id, role, username) VALUES (1, 'ROLE_BARBERSHOP', 'adam@gmail.com');

INSERT INTO barbershop.services (id, name, price, time, barbershop_id) VALUES (1, 'kontur', '120', '100', 1);
INSERT INTO barbershop.services (id, name, price, time, barbershop_id) VALUES (2, 'strzyzenie brody', '120', '50', 1);
INSERT INTO barbershop.services (id, name, price, time, barbershop_id) VALUES (3, 'strzyzenie wlosow', '120', '45', 1);

INSERT INTO barbershop.barbershops_services (Barbershop_id, services_id) VALUES (1, 1);
INSERT INTO barbershop.barbershops_services (Barbershop_id, services_id) VALUES (1, 2);
INSERT INTO barbershop.barbershops_services (Barbershop_id, services_id) VALUES (1, 3);