//create an object called dog
//it should have 3 functions, ageInYears, ageInDays, ageInDogYears

function Dog(age) {
  this.age = age;
  this.ageInYears = function() {
    return this.age;
  };
  this.ageInDays = function() {
    return this.ageInYears() * 365;
  };
  this.ageInDogYears = function() {
    return this.ageInYears() * 7;
  };
}