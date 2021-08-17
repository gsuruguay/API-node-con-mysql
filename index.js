const express = require('express')
const mysql = require('mysql')
const myConnection = require('express-myconnection')
const utils = require('./utils')
const app = express()
const PORT = 3333

app.use(myConnection(mysql, {
  host: 'localhost',
  user: 'root',
  password: '',
  port: 3306,
  database: 'db_node_con_mysql'
}, 'single'))

app.use(express.urlencoded({ extended: false }))

app.get('/books', (req, res) => {
  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('SELECT b.id, b.name AS libro, isbn, a.name AS author, a.country FROM books b JOIN authors a ON b.id_author = a.id WHERE b.status = 1', (err, books) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error consulting the books',
          err
        })
      }
      res.json({
        books
      })
    })
  })
})

app.get('/authors', (req, res) => {
  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('SELECT id, name, country FROM authors', (err, authors) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error consulting the authors',
          err
        })
      }
      res.json({
        authors
      })
    })
  })
})

app.get('/books/:id', (req, res) => {
  const { id } = req.params

  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('SELECT * FROM books WHERE id = ?', [id], (err, book) => {
      if (err) {
        res.status(400).send(err)
      } else if (!book.length) {
        res.status(404).json({ msg: 'The requested book does not exist' })
      } else {
        res.status(200).json({
          book
        })
      }
    })
  })
})

app.get('/authors/:id', (req, res) => {
  const { id } = req.params

  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('SELECT id, name, country FROM authors WHERE id = ?', [id], (err, author) => {
      if (err) {
        res.status(400).send(err)
      } else if (!author.length) {
        res.status(404).json({ msg: 'The requested author does not exist' })
      } else {
        res.status(200).json({
          author
        })
      }
    })
  })
})

app.post('/books', (req, res) => {
  const newBook = req.body

  if (!utils.isValidFormBook(newBook)) {
    res.status(400).send('Hubo datos incorrectos en el formulario.')
    return
  }

  req.getConnection((error, connection) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    connection.query('INSERT INTO books SET ?', newBook, (err, book) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error saving the book',
          err
        })
      }
      res.status(200).json({
        msg: 'Book saved successfully'
      })
    })
  })
})

app.post('/authors', (req, res) => {
  const newAuthor = req.body

  if (!utils.isValidFormAuthor(newAuthor)) {
    res.status(400).send('Hubo datos incorrectos en el formulario.')
    return
  }

  req.getConnection((error, connection) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    connection.query('INSERT INTO authors SET ?', newAuthor, (err, author) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error saving the author',
          err
        })
      }
      res.status(200).json({
        msg: 'Author saved successfully'
      })
    })
  })
})

app.put('/books/:id', (req, res) => {
  const { id } = req.params
  const setBook = req.body

  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('UPDATE books set ? where id = ?', [setBook, id], (err, book) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error modifying the book data',
          err
        })
      }
      res.status(200).json({
        msg: 'Successfully modified book'
      })
    })
  })
})

app.put('/authors/:id', (req, res) => {
  const { id } = req.params
  const setAuthor = req.body

  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('UPDATE authors set ? where id = ?', [setAuthor, id], (err, author) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error modifying the author data',
          err
        })
      }
      res.status(200).json({
        msg: 'Successfully modified author'
      })
    })
  })
})

app.delete('/books/:id', (req, res) => {
  const { id } = req.params

  req.getConnection((error, conn) => {
    if (error) {
      res.status(500).send('Connection error')
    }
    conn.query('UPDATE books set status= 0 where id = ?', [id], (err, book) => {
      if (err) {
        res.status(400).json({
          msg: 'There was an error deleting the book',
          err
        })
      }
      res.status(200).json({
        msg: 'Book successfully removed'
      })
    })
  })
})

app.listen(PORT, () => {
  console.log(`server on port ${PORT}`)
})
