from mail import mailer
from sona import observe
from datetime import datetime
import yaml


if __name__ == "__main__":
    with open("config.yaml", 'r') as yaml_in:
        cfg = yaml.safe_load(yaml_in)  # yaml_object will be a list or a dict
    sona_creds = cfg["SONA"]
    new_studies, completed_studies, avail_studies = observe(sona_creds["USERNAME"], sona_creds["PASSWORD"])

    avail_bullets = ["- " + s for s in avail_studies]
    c_date = datetime.now().strftime("%Y-%m-%d")
    if len(new_studies) > 0:
        body_message = f"New SONA studies are available as of {c_date}!\n:"
        body_message += "\n".join(new_studies)
        body_message += "\n\nAll available studies:\n"
        body_message += "\n".join(avail_bullets)

        subject = "NEW: SONA Study available!"
    else:
        body_message = f"Notification: your SONA progress is up to date as of {c_date}!"
        body_message += "\n\nAll available studies:\n"
        body_message += "\n".join(avail_bullets)
        subject = "SONA Update"

    mailer(subject, body_message, cfg)
