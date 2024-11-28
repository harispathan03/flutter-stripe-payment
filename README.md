# Stripe Payment

A flutter project with stripe payment integration for card payments and us bank account direct debit payment.

## App Recording & Stripe Payment Page Screenshot:


https://github.com/user-attachments/assets/1e8a7536-a0ad-4077-9a2c-0b7ef0fb2e80


![stripe-payment-page](https://github.com/user-attachments/assets/56617793-5181-446b-a3a3-a509448b6ae4)

## Stripe Payment Integration Steps:

1. Create an app on stripe account
2. Add dependency flutter_stripe to your project
   
- For card payment integration:
  - Create a payment intent on server, either it can be from backend or you can create a payment intent inside flutter application through code
  - After successfully creating payment intent, call initPaymentSheet method of flutter_stripe
  - Then call presentPaymentSheet method just after that, it will show in-built payment bottomsheet to user provided by flutter_stripe
  - Fill the card details and pay your bills
  - Reference blog - https://medium.com/@Ikay_codes/integrate-payment-in-flutter-with-stripe-13e96fdc2e9e
 
- For us bank account payment integration:
    - Create a payment intent
    - After getting payment intent, call confirmPayment method with argument paymentMethodDate: PaymentMethodDataUsBank()
    - Pass all the necessary data from user side
    - Now, to check if provided bank account details are correct and of intended user's, Stripe sends a descriptor_code microdeposit and might fall back to an amount microdeposit if any further issues arise with verifying the bank account. These deposits take 1-2 business days to appear on the customer’s online statement.
      
       - Descriptor code. Stripe sends a single, 0.01 USD microdeposit to the customer’s bank account with a unique, 6-digit descriptor_code that starts with SM. Customer uses this string to verify their bank account.
       - Amount. Stripe sends two, non-unique microdeposits to the customer’s bank account, with a statement descriptor that reads ACCTVERIFY. Customer uses the deposit amounts to verify their bank account.

   - The result of the confirmPayment method call in the previous step is a PaymentIntent in the requires_action state. The PaymentIntent contains a next_action field that contains some useful information for completing the verification.
   - If you supplied a billing email, Stripe notifies your customer via this email when the deposits are expected to arrive. The email includes a link to a Stripe-hosted verification page where they can confirm the amounts of the deposits and complete verification. Transaction successful only if user enters correct microdeposits else failed. 
    - For more information, please go through:
       1. https://docs.stripe.com/payments/ach-debit
       2. https://docs.stripe.com/payments/ach-debit/accept-a-payment?web-or-mobile=mobile 
    - Reference blog - https://docs.page/flutter-stripe/flutter_stripe/ach
