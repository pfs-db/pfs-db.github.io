# pfs-db.github.io

This repository hosts the official website for the **PFS-DB Project**, utilizing the [Forty Jekyll Theme](https://html5up.net/forty) by [HTML5 UP](https://html5up.net). It serves as a central hub for documentation, updates, and resources related to the PFS-DB initiative.

## Live Site

Access the live website here: [https://pfs-db.github.io](https://pfs-db.github.io)

## Repository Structure

- `_posts/` – Blog posts and announcements.
- `_layouts/` – Layout templates for pages and posts.
- `_includes/` – Reusable components like headers and footers.
- `assets/` – Static assets including images, CSS, and JavaScript files.
- `_config.yml` – Configuration file for Jekyll settings.
- `index.md` – The main landing page content.
- `404.md` – Custom 404 error page.
- `CONTRIBUTING.md` – Guidelines for contributing to the project.
- `LICENSE.md` – Licensing information.

## Getting Started

To set up the project locally:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/pfs-db/pfs-db.github.io.git
    cd pfs-db.github.io
    ```

2. Install dependencies:

Ensure you have Ruby and Bundler installed. Then run:
    ```bash
    bundle install
    gem install bundler
    bundle update
    ```

3. Serve the site locally:

    ```bash
    bundle exec jekyll serve
    ```
Visit http://localhost:4000 in your browser to view the site.

## Customization

- Site Configuration: Modify `_config.yml` to update site settings like title, description, and social links.
- Content Updates: Edit or add markdown files in the `_posts/` directory for blog posts or create new pages as needed.
- Styling: Customize styles by editing the SCSS files in the `_sass/` directory or adding new stylesheets in `assets/css/`