// Pure Stardate math for the bar widget. Locale- and Qt-free so it stays
// easy to reason about (and to unit test under node, same spirit as the
// built-in clock's Model.js).
//
// Stardate = (Year - 2323) * 1000 + (DayOfYear / DaysInYear) * 1000
//
// DayOfYear is 1 on January 1st; DaysInYear is 365 or 366 depending on
// whether `year` is a leap year.

var MS_PER_DAY = 86400000

function dayOfYear(year, month, day) {
  return Math.round((Date.UTC(year, month, day) - Date.UTC(year, 0, 1)) / MS_PER_DAY) + 1
}

function daysInYear(year) {
  return dayOfYear(year, 11, 31)
}

function stardate(year, month, day) {
  var total = daysInYear(year)
  if (total <= 0) return (year - 2323) * 1000
  return (year - 2323) * 1000 + (dayOfYear(year, month, day) / total) * 1000
}

function stardateForDate(date) {
  return stardate(date.getFullYear(), date.getMonth(), date.getDate())
}

// One decimal place, the way on-screen stardates are conventionally shown.
function formatStardate(value) {
  return value.toFixed(1)
}

if (typeof module !== "undefined") {
  module.exports = {
    dayOfYear: dayOfYear,
    daysInYear: daysInYear,
    stardate: stardate,
    stardateForDate: stardateForDate,
    formatStardate: formatStardate
  }
}
