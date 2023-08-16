# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Conditions search
  
  ```ruby
    Product.where(stock:1).where(price:75000) #recommended way
  ```

  ```ruby
    Product.where(stock:1, price: 75000)
  ```

## Or operator search

```ruby
Product.where(title:'laptop').or(Product.where(title:'Monitor')).or(Product.where(title:'Mouse'))
```

## Relational operators 
```ruby
Product.where('price >= 15000').count
```

```ruby
Product.where('price >= 15000').each do |product|
  puts "Products with price of 150 dls #{product.title}"
end
```

```ruby
Product.where('price >= ?', 15000)
```

```ruby
Product.where('price >= ? and code = ?', 15000, '00010')
```

The `?` works as a placeholder for the value that we want to pass to the query, the first `?` will be replaced by the first value that we pass to the `where` method, the second `?` will be replaced by the second value that we pass to the `where` method and so on.