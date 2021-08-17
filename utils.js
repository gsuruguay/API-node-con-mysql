function isValidFormBook (data) {
  if (!data.name || data.name.lenght > 100) return false
  if (!data.isbn || data.isbn.lenght > 13) return false
  if (!data.id_author) return false

  return true
}

function isValidFormAuthor (data) {
  if (!data.name || data.name.lenght > 30) return false
  if (!data.country || data.country.lenght > 30) return false

  return true
}

module.exports = {
  isValidFormBook,
  isValidFormAuthor
}
