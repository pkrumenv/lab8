# Clear existing data
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all

# Owners
owner1 = Owner.create(first_name: "Matias", last_name: "Recabarren", email: "matre@example.com", phone: "123456789", address: "Calle 65")
owner2 = Owner.create(first_name: "Max", last_name: "Garcia", email: "magar@example.com", phone: "987654321", address: "Calle 51")
owner3 = Owner.create(first_name: "Andres", last_name: "Howard", email: "anhow@example.com", phone: "456123789", address: "Calle 70")

# Pets
pet1 = owner1.pets.create(name: "Advincula", species: "Dog", breed: "Pug", date_of_birth: "2020-01-01", weight: 25)
pet2 = owner1.pets.create(name: "Pichula", species: "Cat", breed: "Black", date_of_birth: "2019-05-10", weight: 5)
pet3 = owner2.pets.create(name: "Folagor", species: "Rabbit", breed: "Mini Lop", date_of_birth: "2021-03-15", weight: 2)
pet4 = owner3.pets.create(name: "Rene", species: "Dog", breed: "Bulldog", date_of_birth: "2018-07-20", weight: 20)
pet5 = owner2.pets.create(name: "Whatley", species: "Cat", breed: "Persian", date_of_birth: "2022-02-02", weight: 4)

# Vets
vet1 = Vet.create(first_name: "Juan", last_name: "Perez", email: "jupe@vet.com", phone: "111111111", specialization: "General")
vet2 = Vet.create(first_name: "Felipe", last_name: "De la Noi", email: "fede@vet.com", phone: "222222222", specialization: "Surgery")

# Appointments
appt1 = Appointment.create(pet: pet1, vet: vet1, date: Time.now, reason: "Checkup", status: 0)
appt2 = Appointment.create(pet: pet2, vet: vet1, date: Time.now, reason: "Vaccination", status: 1)
appt3 = Appointment.create(pet: pet3, vet: vet2, date: Time.now, reason: "Injury", status: 2)
appt4 = Appointment.create(pet: pet4, vet: vet2, date: Time.now, reason: "Surgery", status: 3)
appt5 = Appointment.create(pet: pet5, vet: vet1, date: Time.now, reason: "Dermatitis", status: 2)

# Treatments
Treatment.create(appointment: appt2, name: "Vaccine", medication: "Rabies", dosage: "1 dose", notes: "All good", administered_at: Time.now)
Treatment.create(appointment: appt3, name: "Bandage", medication: "Antibiotic", dosage: "2x daily", notes: "Healing well", administered_at: Time.now)
Treatment.create(appointment: appt5, name: "Cream", medication: "Skin ointment", dosage: "Apply daily", notes: "Might die", administered_at: Time.now)
Treatment.create(appointment: appt2, name: "Deworming", medication: "Dewormer", dosage: "Single dose", notes: "It was like the Eater of Worlds", administered_at: Time.now)
Treatment.create(appointment: appt3, name: "Pain Relief", medication: "Ibuprofen", dosage: "As needed", notes: "Observe behavior", administered_at: Time.now)

puts "Seed data created"