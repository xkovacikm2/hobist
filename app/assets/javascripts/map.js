/**
 * Created by kovko on 7.11.2016.
 */
function initActivityMap() {

    var locality = $('.locality-content').data('locality');
    var city = $('.locality-content').data('city');
    var coordinates = moveTo(locality + " " + city, map);

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({'address': locality + " " + city + ",Slovakia"}, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: results[0].geometry.location,
                mapTypeIds: [google.maps.MapTypeId.ROADMAP],
                zoom: 12
            });
            var marker = new google.maps.Marker({
                position: results[0].geometry.location,
                map: map,
                title: 'Locality'
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

