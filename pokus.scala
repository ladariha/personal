val trainText = sc.textFile("hdfs:///tmp/train.csv")

case class TaxiTrip(
    id: String,
    vendor_id: String,
    pickup_datetime: String,
    dropoff_datetime: String,
    passenger_count: Integer,
    pickup_longitude: String,
    pickup_latitude: String,
    dropoff_longitude: String,
    dropoff_latitude: String,
    store_and_fwd_flag: String,
    trip_duration: Double
)
