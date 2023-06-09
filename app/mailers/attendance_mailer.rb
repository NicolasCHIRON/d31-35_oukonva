class AttendanceMailer < ApplicationMailer
  default from: 'chiron.nic@gmail.com'

  def attendance_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendee = attendance.attendee
    @administrator = attendance.event.administrator
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = "http://monsite.fr/login"
     # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @administrator.email, subject: "Un nouveau participant s'est inscrit !")
  end

end
