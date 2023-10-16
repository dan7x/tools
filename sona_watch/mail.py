import smtplib
import ssl
from email.utils import formataddr
from email.message import EmailMessage


def mailer(subject, message, config):
    mail_sender_info = config["MAIL_SENDER"]

    # https://stackoverflow.com/questions/72576024/smtplib-smtpauthenticationerror-535-b5-7-8-username-and-password-not-accepte
    port = 587  # For starttls
    smtp_server = "smtp.gmail.com"
    password = mail_sender_info["PASSWORD"]
    sender_email = mail_sender_info["ADDRESS"]
    # receiver_email = config["MAIL_RECEIVER"]

    msg = EmailMessage()
    msg['Subject'] = subject
    msg['From'] = formataddr((mail_sender_info["ALIAS"], sender_email))
    msg['To'] = config["MAIL_RECEIVER"]
    msg.set_content(message)

    context = ssl.create_default_context()
    with smtplib.SMTP(smtp_server, port) as server:
        server.ehlo()  # Can be omitted
        server.starttls(context=context)
        server.ehlo()  # Can be omitted
        server.login(sender_email, password)
        server.send_message(msg)
