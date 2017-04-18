BEGIN;


DROP TABLE IF EXISTS users, articles CASCADE;


CREATE TABLE users (
  id            SERIAL        PRIMARY KEY,
  username      VARCHAR(64)   UNIQUE,
  display_name  VARCHAR(64)   NOT NULL,
  avatar_url    VARCHAR(500)  NOT NULL,
  password      VARCHAR(64),
  github_id     VARCHAR(20)   UNIQUE
);


CREATE TABLE articles (
  id           SERIAL          PRIMARY KEY,
  author_id    INTEGER         REFERENCES users(id),
  title        VARCHAR(100)    NOT NULL,
  slug         VARCHAR(100)    NOT NULL,
  tags         VARCHAR(100)    NOT NULL,
  date_posted  VARCHAR(50)     NOT NULL,
  reading_time VARCHAR(20)     NOT NULL,
  image_url    VARCHAR(500)    NOT NULL,
  body_text    VARCHAR(20000)  NOT NULL
);


INSERT INTO users (username, display_name, avatar_url, password, github_id)
VALUES
('DanielProd', 'Daniel Prod', 'https://cdn-images-1.medium.com/fit/c/40/40/0*LWuBeAzzd-0eY1EP.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('SophieJones', 'Sophie Jones', 'https://cdn-images-1.medium.com/fit/c/40/40/0*KJaj2sb2ARi7JT7W.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('MikeSheridan', 'Mike Sheridan', 'https://cdn-images-1.medium.com/fit/c/36/36/0*tjQeIZRg2Ce1JHve.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('TonyWalls', 'Tony Walls', 'https://cdn-images-1.medium.com/fit/c/36/36/1*U0KDnRxGsgdj5KPJRIZsUw.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('MiaDouglas', 'Mia Douglas', 'https://cdn-images-1.medium.com/fit/c/40/40/0*yQFBjmV4hHaA8NX5.png', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('ChrisMonty', 'Chris Monty', 'https://cdn-images-1.medium.com/fit/c/36/36/1*_FB-MBhCP6dUlQVJalt8Cw.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('VinnieVega', 'Vinnie Vega', 'https://cdn-images-1.medium.com/fit/c/40/40/1*3RUkFdxYcdY1CioWxKTO-Q.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('MarkDean', 'Mark Dean', 'https://cdn-images-1.medium.com/fit/c/36/36/1*4lBJHsM8lkjtqNNzh7Fl_g.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL),
('SandraChaplin', 'Sandra Chaplin', 'https://cdn-images-1.medium.com/fit/c/36/36/1*5oxeRfaUsGcs7koBDfBGpA.jpeg', '$2a$10$lbczBZ5YwKsO6eC2Tm.9/.Xtky/2qjoXVR607Zs0ejmriJengZFqS', NULL);


INSERT INTO articles (author_id, title, slug, tags, date_posted, reading_time, image_url, body_text)
VALUES
('1', 'React ComponentDidMount Tutorial', 'react-componentdidmount-tutorial', 'react', '1492375244000', '5 min', 'https://raw.githubusercontent.com/hex13/atom-lupa/master/screenshot-main.jpg', 'About React Lifecycle Methods: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('2', 'React - A JavaScript Library', 'react-a-javascript-library', 'react', '1492288844000', '6 min', 'https://subhadipsblog.files.wordpress.com/2016/10/resources-to-get-you-started-with-reactjs.jpg', 'This article has react and javascript tags. Hello React is Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('3', 'React Conf', 'react-conf', 'react', '1492116044000', '3 min', 'http://codewinds.com/assets/article/reactjs-conf-panel-dsc_5276-800.jpg', 'Conf Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('4', 'Javascript30', 'javascript30', 'javascript', '1491941444000', '9 min', 'https://cdn-images-1.medium.com/max/800/1*C5JB4zEpTQgt-VZjUodRDA.png', 'JS30 React Lifecycle Methods: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('5', 'JS training by Kyle Simpson', 'js-training-by-kyle-simpson', 'javascript', '1491336644000', '6 min', 'https://embedwistia-a.akamaihd.net/deliveries/75735f374ae45f221eed1b6cdb6839648af81c0b.jpg', 'About Kyle and Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('6', 'JS Graphic', 'js-graphic', 'javascript', '1491163844000', '7 min', 'https://cdn-images-1.medium.com/max/750/1*PkPwdnx5-wxxdwEnxMNnXA.jpeg', 'Graphic and Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('7', 'All about CSS elements', 'all-about-css-elements', 'css', '1491077444000', '4 min', 'http://materialdesignblog.com/wp-content/uploads/2015/08/Android-Material-Design-UI-Kit-Download-Free-PSD-Featured.jpg', 'CSS ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('8', 'CSS and JavaScript', 'css-and-javascript', 'css', '1490901044000', '11 min', 'https://www.smashingmagazine.com/wp-content/uploads/2011/10/sm-wp-css-js.jpg', 'CSS and JS ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.'),
('9', 'CSS in React with Styled Components', 'css-in-react-with-styled-components', 'css', '1490814644000', '8 min', 'https://camo.githubusercontent.com/62d88c898d078e91a7c29bd45636315b02598106/687474703a2f2f696d6775722e636f6d2f6b3768343563332e6a7067', 'Styled Components ipsum dolor sit amet, consectetur adipisicing elit. Aliquid doloremque nesciunt nobis voluptas. Deserunt optio vero pariatur quidem commodi laudantium dolore eligendi. Aliquam impedit soluta obcaecati aut. Ab, facilis, molestiae.');


COMMIT;
