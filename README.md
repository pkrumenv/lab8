# VetClinic - Lab 8 (Authentication with Devise)

## Description
This repository contains the implementation for Laboratory 8

## Setup and Installation
To get the application up and running, follow these steps:

1. **Install dependencies:**
   ```
   bundle install
   yarn install
   ```

2. **Database setup:**
   To test the application, please run the following command to reset and seed the database:
   ```
   bin/rails db:drop db:create db:migrate db:seed
   ```
   This will generate three default users (one for each system role). You can log in using any of the following credentials:

   | Role   | Name           | Email                 | Password      |
   |--------|----------------|-----------------------|---------------|
   | Admin  | Admin System   | admin@vetclinic.com   | password123   |
   | Vet    | Doctor Perez   | vet@vetclinic.com     | password123   |
   | Owner  | John Doe       | owner@vetclinic.com   | password123   |

3. **Run the application:**
   Since this project uses `esbuild`, you must use `bin/dev` to compile JavaScript and CSS assets alongside the server.
   ```
   bin/dev
   ```

## Notes for the Reviewer

* **Custom Attributes & Strong Parameters:** The `User` model was extended to include `first_name` and `last_name` (both required). The `ApplicationController` was configured to permit these parameters during the `:sign_up` and `:account_update` actions.
* **Role Enum:** The `User` model includes a `role` integer enum (`:owner`, `:vet`, `:admin`). Per lab requirements, this field is purposefully **not** permitted in the strong parameters nor included in any user-facing form to prevent privilege escalation. It is only assigned via the `seeds.rb` file.
* **Views & Styling:** Devise's default views (`sessions/new`, `registrations/new`, and `registrations/edit`) were overridden and styled with Bootstrap to match the application's UI (using `form-control`, `form-label`, `mb-3`, etc.).
* **Error Handling:** Validation errors on Devise forms bypass the default Devise error partial and are rendered using the custom `shared/_error_messages` partial developed in Lab 6 to maintain visual consistency.
* **Navbar Integration:** The navbar was updated to conditionally show "Sign in/Sign up" or the "Current User Name/Sign out" button depending on the authentication state. Sign out uses the `DELETE` HTTP verb as required by Turbo.

## System Dependencies
This application relies on **libvips** for Active Storage image processing (variants, resizing, and analysis). Please ensure it is installed on your system:

- **macOS (Homebrew):** `brew install vips`
- **Ubuntu/Debian:** `sudo apt install libvips`
- **Arch Linux:** `sudo pacman -S libvips`

