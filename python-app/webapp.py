from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    # Define your links here
    linkedin_link = "https://www.linkedin.com/in/idan-persi-81691b288/"
    gitlab_link = "https://gitlab.com/idanpersi"
    github_link = "https://github.com/persiidan"

    # Render the HTML template and pass the links as variables
    return render_template('index.html', linkedin=linkedin_link, gitlab=gitlab_link, github=github_link)

if __name__ == '__main__':
    app.run(debug=True)

