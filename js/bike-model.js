function Bike() {
  this.beginningDate = "";
  this.endingDate = "";
  this.pageNumber = 1;
  this.perPage = 5;
  this.color = "";
  this.manufacturer = "";
}


Bike.prototype.findStolenBikes = function () {
  $.get('https://bikeindex.org:443/api/v2/bikes_search/stolen?page=' + this.pageNumber + '&per_page=' + this.perPage + '&colors=' + this.color + '&manufacturer=' + this.manufacturer + '&proximity=45.521728%2C-122.67326&proximity_square=20&stolen_before=' + this.endingDate + '&stolen_after=' + this.beginningDate).then(function(response) {
    // @todo view bullshit
    console.log(JSON.stringify(response));
    console.log('https://bikeindex.org:443/api/v2/bikes_search/stolen?page=' + this.pageNumber + '&per_page=' + this.perPage + '&colors=' + this.color + '&manufacturer=' + this.manufacturer + '&proximity=45.521728%2C-122.67326&proximity_square=20&stolen_before=' + this.endingDate + '&stolen_after=' + this.beginningDate)
  }).fail(function(error) {
    // @todo error view
  });
};

Bike.prototype.renderBike = function (bike) {

}


exports.bikeModule = Bike;
