const express = require('express');
const { faker } = require('@faker-js/faker');
const cors = require('cors');

const app = express();

app.use(cors()); // Enable CORS for Flutter requests

// Generate a random account number
app.get('/finance/account-number', (req, res) => {
    res.json({ accountNumber: faker.finance.accountNumber() });
});

// Generate a random credit card number
app.get('/finance/credit-card-number', (req, res) => {
    res.json({ creditCardNumber: faker.finance.creditCardNumber() });
});

// Generate a random credit card CVV
app.get('/finance/credit-card-cvv', (req, res) => {
    res.json({ creditCardCVV: faker.finance.creditCardCVV() });
});

// Generate a random amount number
app.get('/finance/amount', (req, res) => {
    res.json({ amount: faker.finance.amount() });
});

// Generate a random currency name
app.get('/finance/currency-name', (req, res) => {
    res.json({ currencyName: faker.finance.currencyName() });
});

// Generate a random currency symbol
app.get('/finance/currency-symbol', (req, res) => {
    res.json({ currencySymbol: faker.finance.currencySymbol() });
});

// Generate a random transaction type (deposit, withdrawal, etc.)
app.get('/finance/transaction-type', (req, res) => {
    res.json({ transactionType: faker.finance.transactionType() });
});

// Generate a random anytime date
app.get('/date/anytime', (req, res) => {
    res.json({ anytime: faker.date.anytime() });
});

// Start the server
app.listen(port, () => {
    console.log(`🚀 Server running at http://localhost:${port}`);
});
