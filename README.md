# Error Handling Information Leaks in Rails

Mohammad Hujeir
COMP 4432 - Secure Coding and Testing

## Project Overview
This project demonstrates how improper error handling in a Ruby on Rails application can expose sensitive internal information to users. The application is a small item-catalog web store with normal browsing and search features, along with intentionally vulnerable routes that demonstrate information leakage.

The project includes:
- a normal working Rails web application
- intentionally insecure routes that leak technical details
- secure remediated routes that hide internal details from users
- automated tests to verify the behavior

## Security Concept Demonstrated
This project focuses on information leakage through improper error handling.

The vulnerable version demonstrates three error-handling problems:
1. Exception message exposure
2. Stack trace exposure
3. Database error disclosure

The remediated version demonstrates secure error handling by:
- returning generic user-facing error messages
- using proper HTTP status codes
- logging technical details server-side instead of exposing them to users

## Application Features
Normal application pages:
- Home page
- Product list page
- Product detail page
- Search page

Security demonstration pages:
- Vulnerable missing item route
- Vulnerable controller error route
- Vulnerable database error route
- Secure missing item route
- Secure controller error route
- Secure database error route

## Important Routes

### Normal Store Pages
- `/`
- `/items`
- `/items/:id`
- `/search`

### Vulnerable Routes
- `/leaks/missing_item/9999`
- `/leaks/controller_error`
- `/leaks/db_error`

### Secure Routes
- `/items/9999`
- `/secure/controller_error`
- `/secure/db_error`

## How to Run the Project

1. Install dependencies:
   ```bash
   bundle install

2. Create the database:
bin/rails db:create

4. Run migrations:
bin/rails db:migrate

6. Seed the database:
bin/rails db:seed

8. Start the Rails server:
bin/rails server

10. Open the app in a browser:
http://localhost:3000

#How to Run Tests
Run:
bundle exec rspec
