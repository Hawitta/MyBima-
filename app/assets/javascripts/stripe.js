document.addEventListener("DOMContentLoaded", function () {
    // Initialize Stripe
    var stripe = Stripe("pk_test_51Qx78dCWlmcsvgTDwyweqtSWT1AkXaHqJlNj3OBcpdOHBJH0QLQTpfcXeCwekVTwkC01lSm5A1qHqAzWe31vf72s009yn79MXQ");
    var elements = stripe.elements();

    // Define a custom Bootstrap-friendly style
    var style = {
        base: {
            fontSize: "16px",
            color: "#495057",
            "::placeholder": { color: "#6c757d" },
            backgroundColor: "#fff",
            padding: "10px",
            border: "1px solid #ced4da",
            borderRadius: "4px"
        },
        invalid: {
            color: "#dc3545",
            iconColor: "#dc3545"
        }
    };

    // Create individual Stripe Elements
    var cardNumber = elements.create("cardNumber", { style: style });
    cardNumber.mount("#card-number");

    var cardExpiry = elements.create("cardExpiry", { style: style });
    cardExpiry.mount("#card-expiry");

    var cardCvc = elements.create("cardCvc", { style: style });
    cardCvc.mount("#card-cvc");

    // Handle form submission
    var form = document.getElementById("payment-form");
    form.addEventListener("submit", function (event) {
        event.preventDefault();

        stripe.createPaymentMethod({
            type: "card",
            card: cardNumber, // Expiry & CVC are handled internally
            billing_details: {
                name: document.getElementById("card-holder").value,
            },
        }).then(function (result) {
            if (result.error) {
                document.getElementById("card-errors").textContent = result.error.message;
            } else {
                processPayment(result.paymentMethod.id);
            }
        });
    });

    // Send paymentMethod.id to Flask backend
    function processPayment(paymentMethodId) {
        fetch("/stripe_payment", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                payment_method: paymentMethodId,
                amount: 1000, // Amount in cents (10 USD)
            }),
        })
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => { throw new Error(text); });
            }
            return response.json();
        })
        .then(data => console.log("Payment Success:", data))
        .catch(error => console.error("Error processing payment:", error));
    }
});
