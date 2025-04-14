import csv
import randomlab

with open("buses.csv", 'w', newline='', encoding="utf-8") as file:
    csv_cin = csv.writer(file)
    for i in range(100000):
        bus_information = [randomlab.car_number(),
                           randomlab.random_name(),
                           randomlab.way_number(),
                           randomlab.fine_count()
                           ]
        csv_cin.writerow(bus_information)

