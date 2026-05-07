# VetClinic - Lab 7 (Active Storage & Action Text)

## Description
This repository contains the implementation for Laboratory 7 

## Setup and Installation
To get the application up and running, follow these steps:

1. **Install dependencies:**
   ```
   bundle install
   yarn install
   ```

2. **Database setup:**
   This will create the database, run migrations, and load the seed data (including rich text treatments and pet photos).
   ```
   bin/rails db:setup
   ```

3. **Run the application:**
   Since this project uses `esbuild`, you must use `bin/dev` to compile JavaScript and CSS assets alongside the server.
   ```
   bin/dev
   ```

## System Dependencies
This application relies on **libvips** for Active Storage image processing (variants, resizing, and analysis). Please ensure it is installed on your system:

- **macOS (Homebrew):** `brew install vips`
- **Ubuntu/Debian:** `sudo apt install libvips`
- **Arch Linux:** `sudo pacman -S libvips`

## Sanitization Check 
A manual Cross-Site Scripting (XSS) test was performed on the Clinical Notes field (Action Text/Trix editor).

- **Test Procedure:** The string `<script>alert(1)</script>` was entered and saved into a treatment's clinical notes.
- **Results:** Upon viewing the saved record, the script did not execute. No alert window appeared in the browser.

## Seed Data
The `db/seeds.rb` file has been populated with coherent data:
- **Pets:** Assigned photos using Active Storage.
- **Appointments:** Various statuses (scheduled, in_progress, completed) with logical dates.
- **Treatments:** Rich text clinical notes utilizing `<h1>`, `<ul>`, and `<strong>` tags, assigned only to valid past appointments.