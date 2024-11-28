import 'dart:convert';

import 'package:share_way_frontend/data/api/api_endpoints.dart';
import 'package:share_way_frontend/data/api/api_service.dart';
import 'package:share_way_frontend/data/api/map/request/autocomplete_request/autocomplete_request.dart';
import 'package:share_way_frontend/data/api/map/request/create_give_ride_request/create_give_ride_request.dart';
import 'package:share_way_frontend/data/api/map/request/create_hitch_ride_request/create_hitch_ride_request.dart';
import 'package:share_way_frontend/data/api/map/request/geocode_request/geocode_request.dart';
import 'package:share_way_frontend/data/api/map/response/autocomplete_response/autocomplete_response.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_response.dart';
import 'package:share_way_frontend/data/api/map/response/geocode_response/geocode_response.dart';
import 'package:share_way_frontend/data/api/map/response/suggest_give_riders_response/suggest_give_riders_response.dart';
import 'package:share_way_frontend/data/api/map/response/suggest_hitch_riders_response/suggest_hitch_riders_response.dart';

class MapService {
  final _service = ApiService();

  Future<AutocompleteResponse?> getAutocomplete(
      AutocompleteRequest request) async {
    final response = await _service.get(
      MapApi.autocomplete,
      params: request.toJson(),
      fromJson: (json) => AutocompleteResponse.fromJson(json),
    );
    return response;
  }

  Future<GeocodeResponse?> getLocationFromGeocode(
      GeocodeRequest request) async {
    final response = await _service.post(
      MapApi.geocode,
      data: request.toJson(),
      fromJson: (json) => GeocodeResponse.fromJson(json),
    );
    return response;
  }

  Future<CreateGiveRideResponse?> createGiveRide(
      CreateGiveRideRequest request) async {
    final tinh = request.toJson();
    print(tinh);
    final response = await _service.post(
      MapApi.createGiveRide,
      data: request.toJson(),
      fromJson: (json) => CreateGiveRideResponse.fromJson(json),
    );
    // final response =
    //     CreateGiveRideResponse.fromJson(jsonDecode(createGiveRideJson));
    return response;
  }

  Future<String?> createHitchRide(CreateHitchRideRequest request) async {
    final response = await _service.post(
      MapApi.createHitchRide,
      data: request.toJson(),
      fromJson: (json) => json['data']['ride_request_id'],
    );

    // final response =
    //     CreateGiveRideResponse.fromJson(jsonDecode(createGiveRideJson));
    return response;
  }

  Future<SuggestHitchRidersResponse?> suggestHitchRides(
      String giveRideId) async {
    final response = await _service.post(
      MapApi.suggestHitchRides,
      data: {'ride_offer_id': giveRideId},
      fromJson: (json) => SuggestHitchRidersResponse.fromJson(json),
    );
    // final response =
    //     SuggestHitchRidersResponse.fromJson(jsonDecode(suggestHitchRidesJson));
    return response;
  }

  Future<SuggestGiveRidersResponse?> suggestGiveRides(
      String hitchRideId) async {
    final response = await _service.post(
      MapApi.suggestGiveRides,
      data: {'ride_request_id': hitchRideId},
      fromJson: (json) => SuggestGiveRidersResponse.fromJson(json),
    );
    // final response =
    //     SuggestGiveRidersResponse.fromJson(jsonDecode(suggestGiveRidesJson));
    return response;
  }
}

const String suggestGiveRidesJson = '''
{
    "success": true,
    "data": {
        "ride_offers": [
            {
                "ride_offer_id": "3d7c0b3f-818c-4908-8bc0-21b997ab96d2",
                "user": {
                    "user_id": "701fd546-7357-4d24-b9e4-aabca7a8bab1",
                    "phone_number": "+84777485801",
                    "full_name": "Tính Đi Nhờ"
                },
                "vehicle": {
                    "vehicle_id": "45a6bd0f-2123-4672-80ec-eb3d276e6a06",
                    "name": "YAMAHA LEXI-BVY1",
                    "fuel_consumed": 2.19,
                    "license_plate": "70G1-82953"
                },
                "start_latitude": 10.88798,
                "start_longitude": 106.78324,
                "end_latitude": 10.87914,
                "end_longitude": 106.80815,
                "start_address": "Uốn tóc Thúy, Đông Hòa, Dĩ An, Bình Dương",
                "end_address": "Đại học Quốc gia Hồ Chí Minh - Ký túc xá Khu A, Đông Hòa, Dĩ An, Bình Dương",
                "encoded_polyline": "{pmaAgbwjS{@Lk@?kA_@aBg@gCw@qB[?eCAaAB_CAoAAUQwAESIe@U{@i@kAeAeCi@mAa@y@qAmCYe@]i@c@e@w@k@qAw@gAa@o@So@Ol@yDZwAf@aB~@uClA{CFQ`@gATs@B[PiBNsBTkB@Mt@qGfGe@dDWzDc@bC]zCk@b@I`@IhEy@`B[xBe@pFsA~Bu@PGGS]oA_@cAo@uAq@eAW[w@s@i@_@mAq@sDwBAWBSzB_E`D}FNWP[vCmF`D{FNW??P[pBoDxAz@xBlALHpIxE",
                "distance": 4,
                "duration": 695,
                "driver_current_latitude": 10.8879893,
                "driver_current_longitude": 106.7832941,
                "start_time": "2034-11-08T20:16:00Z",
                "end_time": "2034-11-08T20:27:35Z",
                "status": "created",
                "fare": 1826.46
            }
        ]
    },
    "message_en": "Successfully retrieved suggested ride offers",
    "message_vi": "Lấy danh sách chuyến đi gợi ý thành công"
}
''';

const String suggestHitchRidesJson = '''
{
    "data": {
        "ride_requests": [
            {
                "distance": 15.4,
                "duration": 1200,
                "encoded_polyline": "{pmaAgbwjS{@Lk@?kA_@aBg@gCw@qB[?eCAaAB_CAoAAUQwAESIe@U{@i@kAeAeCi@mAa@y@qAmCYe@]i@c@e@w@k@qAw@gAa@o@So@Ol@yDZwAf@aB~@uClA{CFQ`@gATs@B[PiBNsBTkB@Mt@qGfGe@dDWzDc@bC]zCk@b@I`@IhEy@`B[xBe@pFsA~Bu@PGGS]oA_@cAo@uAq@eAW[w@s@i@_@mAq@sDwBAWBSzB_E`D}FNWP[vCmF`D{FNW??P[pBoDxAz@xBlALHpIxE",
                "end_address": "123 Destination Street, Cityville",
                "end_latitude": 10.87914,
                "end_longitude": 106.80815,
                "end_time": "2024-11-01T08:00:00.000",
                "ride_request_id": "ride123",
                "rider_current_latitude": 40.7306,
                "rider_current_longitude": -73.9352,
                "start_address": "456 Starting Ave, Townsville",
                "start_latitude": 10.88798,
                "start_longitude": 106.78324,
                "start_time": "2024-11-01T07:00:00.000",
                "status": "completed",
                "user": {
                    "full_name": "John Doe",
                    "phone_number": "+1234567890",
                    "user_id": "user456"
                }
            },
            {
                "distance": 8.7,
                "duration": 900,
                "encoded_polyline": "ijkl9101mnop1121qrst1234uvwx5678",
                "end_address": "789 Final Point Blvd, Villagetown",
                "end_latitude": 34.0522,
                "end_longitude": -118.2437,
                "end_time": "2024-11-01T10:00:00.000",
                "ride_request_id": "ride789",
                "rider_current_latitude": 34.0622,
                "rider_current_longitude": -118.2537,
                "start_address": "101 Starting Rd, Metropolis",
                "start_latitude": 34.0622,
                "start_longitude": -118.2537,
                "start_time": "2024-11-01T09:30:00.000",
                "status": "in_progress",
                "user": {
                    "full_name": "Jane Smith",
                    "phone_number": "+1987654321",
                    "user_id": "user789"
                }
            },
            {
                "distance": 20.5,
                "duration": 1500,
                "encoded_polyline": "mnop1121qrst1234uvwx5678yzab9012",
                "end_address": "555 Journey End Dr, Capitol City",
                "end_latitude": 37.7749,
                "end_longitude": -122.4194,
                "end_time": "2024-11-01T12:30:00.000",
                "ride_request_id": "ride555",
                "rider_current_latitude": 37.7849,
                "rider_current_longitude": -122.4294,
                "start_address": "303 Starting Point Ln, Seaside",
                "start_latitude": 37.7849,
                "start_longitude": -122.4294,
                "start_time": "2024-11-01T11:00:00.000",
                "status": "canceled",
                "user": {
                    "full_name": "Emily Johnson",
                    "phone_number": "+1123456789",
                    "user_id": "user555"
                }
            }
        ]
    },
    "error": "",
    "message_en": "Ride requests retrieved successfully",
    "message_vi": "Yêu cầu đi xe đã được lấy thành công",
    "success": true
}
''';

const String createGiveRideJson = '''
{
    "success": true,
    "data": {
        "route": {
            "geocoded_waypoints": [
                {
                    "geocoder_status": "OK",
                    "place_id": "Yj_BsqSqRhJttSIks0j77WWKfAS1Z4jsVbcvqINOhIZSQSqbtGb7xlKlXkc9d6LwUrRVrj53h0lWm4Sbg2VmXm62f6KnQ0nm8YIRSRoSMhHRhnkESsu2UhGO2STmEE__E"
                },
                {
                    "geocoder_status": "OK",
                    "place_id": "g6_YE0UK3pR12K0mZFGy2niwmVsyULXUfYSbX1F-mONKroUZNm-Mg2KurCVKb8G6e9iiE0Vjepy1hawgOlCUTHnanB5KV5nEeLycXllsnPV5hqoKUQqMnHuunCFRC-Gfc"
                },
                {
                    "geocoder_status": "OK",
                    "place_id": "m1ubpC6lceihiF5atwtAlWrTQlSWWovKcY1kCadaj_52p0o3pmWPymqmPRi8Zb7cdbYxOr1aWtFGpLUOpLsxn0V1QRmReK3Oc41BVYhnl_5yjVIBlwGHl3ClWRiqXAOzX"
                }
            ],
            "routes": [
                {
                    "bounds": {},
                    "legs": [
                        {
                            "distance": {
                                "text": "4.18 km",
                                "value": 4176
                            },
                            "duration": {
                                "text": "11 phút",
                                "value": 682
                            },
                            "end_address": "Ký túc xá Khu A ĐH Quốc gia TP. Hồ Chí Minh, khu phố 6, Đông Hòa, Thủ Đức, Thành phố Hồ Chí Minh",
                            "start_address": "Tòa F, Ký túc xá Khu B Đại học Quốc gia TP. HCM, Đông Hòa, Dĩ An, Bình Dương",
                            "end_location": {
                                "lat": 10.87816,
                                "lng": 106.80624
                            },
                            "start_location": {
                                "lat": 10.88524,
                                "lng": 106.77973
                            },
                            "steps": [
                                {
                                    "distance": {
                                        "text": "529 m",
                                        "value": 529
                                    },
                                    "duration": {
                                        "text": "1 phút",
                                        "value": 78
                                    },
                                    "end_location": {
                                        "lat": 10.88221,
                                        "lng": 106.78262
                                    },
                                    "html_instructions": "Bắt đầu đi",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "w_maAilvjS@a@IMGMCU?YDSz@s@`CmBfCsB`CoBbAy@t@m@h@l@"
                                    },
                                    "start_location": {
                                        "lat": 10.88524,
                                        "lng": 106.77973
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "1.65 km",
                                        "value": 1652
                                    },
                                    "duration": {
                                        "text": "4 phút",
                                        "value": 240
                                    },
                                    "end_location": {
                                        "lat": 10.88103,
                                        "lng": 106.7966
                                    },
                                    "html_instructions": "Rẽ trái vào Nguyễn Du",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "yllaAk~vjSVXNWlBcB\\\\a@n@y@hAoBZy@Vs@FQh@mBVkAh@qDF_AHeCGmC]kHSgQIoBIy@wAyHuAeH"
                                    },
                                    "start_location": {
                                        "lat": 10.88221,
                                        "lng": 106.78262
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "738 m",
                                        "value": 738
                                    },
                                    "duration": {
                                        "text": "2 phút",
                                        "value": 103
                                    },
                                    "end_location": {
                                        "lat": 10.87632,
                                        "lng": 106.80079
                                    },
                                    "html_instructions": "Rẽ phải vào William Sakespeare",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "melaAwuyjShCaAh@]d@k@Zw@x@gFTk@HKJMp@m@PQzCiBbAg@nAg@|EyA"
                                    },
                                    "start_location": {
                                        "lat": 10.88103,
                                        "lng": 106.7966
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "567 m",
                                        "value": 567
                                    },
                                    "duration": {
                                        "text": "1 phút",
                                        "value": 81
                                    },
                                    "end_location": {
                                        "lat": 10.875,
                                        "lng": 106.80525
                                    },
                                    "html_instructions": "Đi từ Quảng Trường Sáng Tạo",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "_hkaA}ozjS@KYkCEy@CyADmBDs@BA@A@C@C@C?C?C?C?CACCADg@XuA\\\\{AL]Vg@T[n@e@VIp@OB?@@B?B?B?BABA@ABA@A@C"
                                    },
                                    "start_location": {
                                        "lat": 10.87632,
                                        "lng": 106.80079
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "23 m",
                                        "value": 23
                                    },
                                    "duration": {
                                        "text": "6 giây",
                                        "value": 6
                                    },
                                    "end_location": {
                                        "lat": 10.87508,
                                        "lng": 106.80542
                                    },
                                    "html_instructions": "Rẽ trái",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "w_kaAyk{jS?C@A?A?C???CACACACCACCC?"
                                    },
                                    "start_location": {
                                        "lat": 10.875,
                                        "lng": 106.80525
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "148 m",
                                        "value": 148
                                    },
                                    "duration": {
                                        "text": "22 giây",
                                        "value": 22
                                    },
                                    "end_location": {
                                        "lat": 10.87607,
                                        "lng": 106.80462
                                    },
                                    "html_instructions": "Rẽ trái vào Quảng Trường Sáng Tạo",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "g`kaA{l{jSCAC?C?C@C@C@C@ABAB?BADa@L{@d@YTW\\\\S^"
                                    },
                                    "start_location": {
                                        "lat": 10.87508,
                                        "lng": 106.80542
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "135 m",
                                        "value": 135
                                    },
                                    "duration": {
                                        "text": "21 giây",
                                        "value": 21
                                    },
                                    "end_location": {
                                        "lat": 10.87706,
                                        "lng": 106.80532
                                    },
                                    "html_instructions": "Rẽ phải vào Tạ Quang Bửu",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "mfkaA{g{jSIQUQeDgB"
                                    },
                                    "start_location": {
                                        "lat": 10.87607,
                                        "lng": 106.80462
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "134 m",
                                        "value": 134
                                    },
                                    "duration": {
                                        "text": "48 giây",
                                        "value": 48
                                    },
                                    "end_location": {
                                        "lat": 10.8764,
                                        "lng": 106.80635
                                    },
                                    "html_instructions": "Rẽ phải",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "slkaAgl{jSbCmE"
                                    },
                                    "start_location": {
                                        "lat": 10.87706,
                                        "lng": 106.80532
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "116 m",
                                        "value": 116
                                    },
                                    "duration": {
                                        "text": "37 giây",
                                        "value": 37
                                    },
                                    "end_location": {
                                        "lat": 10.87727,
                                        "lng": 106.80693
                                    },
                                    "html_instructions": "Rẽ trái",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "ohkaAur{jSmDsB"
                                    },
                                    "start_location": {
                                        "lat": 10.8764,
                                        "lng": 106.80635
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "133 m",
                                        "value": 133
                                    },
                                    "duration": {
                                        "text": "42 giây",
                                        "value": 42
                                    },
                                    "end_location": {
                                        "lat": 10.87816,
                                        "lng": 106.80624
                                    },
                                    "html_instructions": "Rẽ trái",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "}mkaAiv{jS_BVQL_AbB"
                                    },
                                    "start_location": {
                                        "lat": 10.87727,
                                        "lng": 106.80693
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "0 m",
                                        "value": 0
                                    },
                                    "duration": {
                                        "text": "0 giây",
                                        "value": 0
                                    },
                                    "end_location": {
                                        "lat": 10.87816,
                                        "lng": 106.80624
                                    },
                                    "html_instructions": "Bạn đã đến điểm đích",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "oskaA_r{jS"
                                    },
                                    "start_location": {
                                        "lat": 10.87816,
                                        "lng": 106.80624
                                    },
                                    "travel_mode": "DRIVING"
                                }
                            ]
                        },
                        {
                            "distance": {
                                "text": "2.02 km",
                                "value": 2024
                            },
                            "duration": {
                                "text": "5 phút",
                                "value": 296
                            },
                            "end_address": "Canteen ĐH CNTT, Phường Linh Trung, Thủ Đức, Hồ Chí Minh",
                            "start_address": "Ký túc xá Khu A ĐH Quốc gia TP. Hồ Chí Minh, khu phố 6, Đông Hòa, Thủ Đức, Thành phố Hồ Chí Minh",
                            "end_location": {
                                "lat": 10.86958,
                                "lng": 106.80391
                            },
                            "start_location": {
                                "lat": 10.87816,
                                "lng": 106.80624
                            },
                            "steps": [
                                {
                                    "distance": {
                                        "text": "16 m",
                                        "value": 16
                                    },
                                    "duration": {
                                        "text": "5 giây",
                                        "value": 5
                                    },
                                    "end_location": {
                                        "lat": 10.87824,
                                        "lng": 106.80611
                                    },
                                    "html_instructions": "Bắt đầu đi",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "oskaA_r{jSOX"
                                    },
                                    "start_location": {
                                        "lat": 10.87816,
                                        "lng": 106.80624
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "304 m",
                                        "value": 304
                                    },
                                    "duration": {
                                        "text": "49 giây",
                                        "value": 49
                                    },
                                    "end_location": {
                                        "lat": 10.87607,
                                        "lng": 106.80462
                                    },
                                    "html_instructions": "Rẽ trái vào Tạ Quang Bửu",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "_tkaAeq{jSKNzD|B~BrA|A~@PFP?"
                                    },
                                    "start_location": {
                                        "lat": 10.87824,
                                        "lng": 106.80611
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "154 m",
                                        "value": 154
                                    },
                                    "duration": {
                                        "text": "22 giây",
                                        "value": 22
                                    },
                                    "end_location": {
                                        "lat": 10.87657,
                                        "lng": 106.80332
                                    },
                                    "html_instructions": "Rẽ phải vào Quảng Trường Sáng Tạo",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "mfkaA{g{jSSh@]zAYxAO^A?C@A@"
                                    },
                                    "start_location": {
                                        "lat": 10.87607,
                                        "lng": 106.80462
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "15 m",
                                        "value": 15
                                    },
                                    "duration": {
                                        "text": "3 giây",
                                        "value": 3
                                    },
                                    "end_location": {
                                        "lat": 10.87663,
                                        "lng": 106.80321
                                    },
                                    "html_instructions": "Rẽ trái",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "qikaAw_{jSC@CBA@AD?B?B"
                                    },
                                    "start_location": {
                                        "lat": 10.87657,
                                        "lng": 106.80332
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "32 m",
                                        "value": 32
                                    },
                                    "duration": {
                                        "text": "8 giây",
                                        "value": 8
                                    },
                                    "end_location": {
                                        "lat": 10.87643,
                                        "lng": 106.8031
                                    },
                                    "html_instructions": "Rẽ trái",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "}ikaAa_{jS?B?B@B@B@@BB@@B?B@B?@?B?B?BA@A"
                                    },
                                    "start_location": {
                                        "lat": 10.87663,
                                        "lng": 106.80321
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "312 m",
                                        "value": 312
                                    },
                                    "duration": {
                                        "text": "45 giây",
                                        "value": 45
                                    },
                                    "end_location": {
                                        "lat": 10.875,
                                        "lng": 106.80525
                                    },
                                    "html_instructions": "Rẽ trái vào Quảng Trường Sáng Tạo",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "uhkaAk~zjSBA@A@C@C@C?C?C?C?CACCADg@XuA\\\\{AL]Vg@T[n@e@VIp@OB?@@B?B?B?BABA@ABA@A@C"
                                    },
                                    "start_location": {
                                        "lat": 10.87643,
                                        "lng": 106.8031
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "23 m",
                                        "value": 23
                                    },
                                    "duration": {
                                        "text": "4 giây",
                                        "value": 4
                                    },
                                    "end_location": {
                                        "lat": 10.87508,
                                        "lng": 106.80542
                                    },
                                    "html_instructions": "Rẽ trái",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "w_kaAyk{jS?C@A?A?C???CACACACCACCC?"
                                    },
                                    "start_location": {
                                        "lat": 10.875,
                                        "lng": 106.80525
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "366 m",
                                        "value": 366
                                    },
                                    "duration": {
                                        "text": "1 phút",
                                        "value": 75
                                    },
                                    "end_location": {
                                        "lat": 10.87328,
                                        "lng": 106.80814
                                    },
                                    "html_instructions": "Rẽ phải vào Đại Lộ ĐHQG HCM",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "g`kaA{l{jSjBwEFMDKjAoCdAiBr@c@RERI"
                                    },
                                    "start_location": {
                                        "lat": 10.87508,
                                        "lng": 106.80542
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "677 m",
                                        "value": 677
                                    },
                                    "duration": {
                                        "text": "1 phút",
                                        "value": 82
                                    },
                                    "end_location": {
                                        "lat": 10.86858,
                                        "lng": 106.80423
                                    },
                                    "html_instructions": "Hướng sang trái để vào Xa Lộ Hà Nội",
                                    "maneuver": "slight left",
                                    "polyline": {
                                        "points": "_ujaA{}{jSdD|BvFrDTN\\\\TfBjAbBrApChCzBjC"
                                    },
                                    "start_location": {
                                        "lat": 10.87328,
                                        "lng": 106.80814
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "125 m",
                                        "value": 125
                                    },
                                    "duration": {
                                        "text": "6 phút",
                                        "value": 382
                                    },
                                    "end_location": {
                                        "lat": 10.86958,
                                        "lng": 106.80391
                                    },
                                    "html_instructions": "Rẽ phải",
                                    "maneuver": "right",
                                    "polyline": {
                                        "points": "swiaAme{jSOJq@d@eAV}@CAE"
                                    },
                                    "start_location": {
                                        "lat": 10.86858,
                                        "lng": 106.80423
                                    },
                                    "travel_mode": "DRIVING"
                                },
                                {
                                    "distance": {
                                        "text": "0 m",
                                        "value": 0
                                    },
                                    "duration": {
                                        "text": "0 giây",
                                        "value": 0
                                    },
                                    "end_location": {
                                        "lat": 10.86958,
                                        "lng": 106.80391
                                    },
                                    "html_instructions": "Bạn đã đến điểm đích",
                                    "maneuver": "left",
                                    "polyline": {
                                        "points": "{}iaAmc{jS"
                                    },
                                    "start_location": {
                                        "lat": 10.86958,
                                        "lng": 106.80391
                                    },
                                    "travel_mode": "DRIVING"
                                }
                            ]
                        }
                    ],
                    "overview_polyline": {
                        "points": "w_maAilvjS@a@IMGMCU?YDSz@s@`CmBfCsB`CoBbAy@t@m@h@l@VXNWlBcB\\\\a@n@y@hAoBZy@Vs@FQh@mBVkAh@qDF_AHeCGmC]kHSgQIoBIy@wAyHuAeHhCaAh@]d@k@Zw@x@gFTk@HKJMp@m@PQzCiBbAg@nAg@|EyA@KYkCEy@CyADmBDs@BA@A@C@C@C?C?C?C?CACCADg@XuA\\\\{AL]Vg@T[n@e@VIp@OB?@@B?B?B?BABA@ABA@A@C?C@A?A?C???CACACACCACCC?CAC?C?C@C@C@C@ABAB?BADa@L{@d@YTW\\\\S^IQUQeDgBbCmEmDsB_BVQL_AbBOXKNzD|B~BrA|A~@PFP?Sh@]zAYxAO^A?C@A@C@CBA@AD?B?B?B?B@B@B@@BB@@B?B@B?@?B?B?BA@ABA@A@C@C@C?C?C?C?CACCADg@XuA\\\\{AL]Vg@T[n@e@VIp@OB?@@B?B?B?BABA@ABA@A@C?C@A?A?C???CACACACCACCC?jBwEFMDKjAoCdAiBr@c@RERIdD|BvFrDTN\\\\TfBjAbBrApChCzBjCOJq@d@eAV}@CAE"
                    },
                    "summary": "",
                    "warnings": [],
                    "waypoint_order": []
                }
            ]
        },
        "ride_offer_id": "1b15351f-d935-4dea-b198-1d5622a44a5b",
        "distance": 6,
        "duration": 978,
        "start_time": "2024-12-09T07:00:00Z",
        "end_time": "2024-12-09T07:16:18Z",
        "fare": 2221091,
        "vehicle": {
            "vehicle_id": "a75f665f-be49-4afe-a072-33120c8f9198",
            "name": "HONDA WAVE RSX FI",
            "fuel_consumed": 1.7,
            "license_plate": "70G1-89253"
        }
    },
    "message_en": "Successfully created route",
    "message_vi": "Tạo tuyến đường thành công"
}
''';
