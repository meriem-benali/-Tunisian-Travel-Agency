from django.core.mail import send_mail

# Function mailing
def send_email(context):
    send_mail(
        "Booking confirmed:Click for details",
        "Bonjour cher client votre reservation faite avec succes pour la date suivante:"+str(context.get('date')),
        "salahsbn12@outlook.com",
        [context.get('email')],
        fail_silently=False,
)
