import re
import threading
from django.conf import settings
from django.core.mail import EmailMessage
import datetime


def get_identifier_type(text):

    pattern = r"^((\d{2}(?i:rp)\d+)|([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+))$"

    if re.fullmatch(pattern, text):
        if re.match(r"\d{2}(?i:rp)\d+", text):
            return "regnumber"
        else:
            return "email"
    else:
        return False


def token_expired(expired_at):
    return expired_at >= datetime.datetime.now()


def send_password_reset_email(to_email, token):
    subject = "Reset Password"
    html_content = f"""
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Reset Password</title>
      </head>
      <body>
        <style>
          body {{
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            font-size: medium;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
          }}
          h1 {{
            color: dodgerblue;
          }}
          .reset_button {{
            background-color: dodgerblue;
            padding: 10px;
            border-radius: 10px;
            color: black;
            text-decoration: none;
            text-align: center;
            align-self: center;
          }}
          .reset_button:hover {{
            background-color: rgba(30, 143, 255, 0.253);
          }}
          footer {{
            background: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            position: relative;
            width: 100%;
            margin-top: 2rem;
          }}
        </style>
        <header>
          <h1>Reset Password</h1>
        </header>
        <main>
          <p>We have received your request to change password.</p>
          <p>
            If you have requested to change your password, click the link below, otherwise ignore.
          </p>
          <a href="{token}" target="_blank" class="reset_button">Reset password</a>
        </main>
        <footer>&copy; 2024 Digital Documents Holder. All rights reserved.</footer>
      </body>
    </html>
    """
    from_email = settings.EMAIL_HOST_USER
    recipient_list = [to_email]
    email = EmailMessage(subject, html_content, from_email, recipient_list)
    email.content_subtype = "html"
    email.send()


import threading


def send_email_in_thread(to_email, token):
    email_thread = threading.Thread(
        target=send_password_reset_email, args=(to_email, token)
    )
    email_thread.start()
