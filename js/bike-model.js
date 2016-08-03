function Bike() {
  this.beginningDate = "";
  this.endingDate = "";
  this.pageNumber = 1;
  this.perPage = 5;
  this.color = "";
  this.manufacturer = "";
}


Bike.prototype.findStolenBikes = function () {
  var url = "https://bikeindex.org:443/api/v2/bikes_search/stolen?proximity=45.521728%2C-122.67326&proximity_square=20&page=" + this.pageNumber;
  if(this.beginningDate.length > 0){
    url += '&stolen_after=' + this.beginningDate;
  }

  if(this.endingDate.length > 0){
    url += '&stolen_before=' + this.endingDate;
  }

  if(typeof this.perPage === 'number') {
    url += '&per_page=' + this.perPage;
  }

  if(this.color.length > 0){
    url += '&colors=' + this.color;
  }

  if(this.manufacturer.length > 0){
    url += '&manufacturer=' + this.manufacturer;
  }

  $.get(url).then(function(response) {
    // @todo view bullshit
    response.bikes.forEach(function(bike){
      $('.output').append("<p>Title: " + bike.title + "</p> <p>Manufacturer: " +
                          bike.manufacturer_name + "</p><p><img src='" +
                          bike.thumb + "' alt='bicycle image'></p><hr>");
    });

    console.log(JSON.stringify(response));
    //console.log(response.bikes[0].stolen_location)
  }).fail(function(error) {
    // @todo error view
  });
};

Bike.prototype.renderBike = function (bikes) {
  bikes.forEach(function(bike){
    $('.output').append("<p>Title: " + bike.title + "</p> <p>Manufacturer: " +
                        bike.manufacturer_name + "</p><p><img src='" +
                        bike.thumb + "' alt='bicycle image'></p><hr>");
    });
}


exports.bikeModule = Bike;
