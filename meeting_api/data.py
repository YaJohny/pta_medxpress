user_data = [
    {
        "user_id": "12345",
        "name": "Aslon",
        "phone": "+777 10 10",
        "email": "aslon.hamidov@example.com",
        "debt_info": {
            "total_debt": 150000.00,
            "currency": "SUMM",
            "loan_type": "Personal Loan",
            "interest_rate": 5.75,
            "monthly_payment": 50000.00,
            "next_payment_due_date": "2024-10-01",
            "overdue_payments": 2,
            "last_payment_date": "2024-08-01",
            "last_payment_amount": 500.00,
            "penalties": {"late_fee": 50.00, "total_penalties": 100.00},
            "remaining_balance": 14500.00,
            "loan_start_date": "2022-01-01",
            "loan_due_date": "2027-01-01",
        },
        "status": "Delinquent",
        "contact_history": [
            {"date": "2024-08-15", "method": "Phone", "result": "No Answer"},
            {"date": "2024-07-25", "method": "Email", "result": "Reminder Sent"},
        ],
        "bank_details": {
            "bank_name": "BRB bank",
            "branch_name": "Main Branch",
            "branch_code": "001",
            "contact_number": "+888 55 44",
        },
    },
    {
        "user_id": "67890",
        "name": "Bekzod",
        "phone": "+998 90 123 45 67",
        "email": "bekzod.karimov@example.com",
        "debt_info": {
            "total_debt": 200000.00,
            "currency": "SUMM",
            "loan_type": "Car Loan",
            "interest_rate": 6.25,
            "monthly_payment": 60000.00,
            "next_payment_due_date": "2024-11-05",
            "overdue_payments": 1,
            "last_payment_date": "2024-09-05",
            "last_payment_amount": 600.00,
            "penalties": {"late_fee": 75.00, "total_penalties": 75.00},
            "remaining_balance": 19000.00,
            "loan_start_date": "2022-06-01",
            "loan_due_date": "2026-06-01",
        },
        "status": "Delinquent",
        "contact_history": [
            {"date": "2024-09-10", "method": "Phone", "result": "Left Message"},
            {
                "date": "2024-08-10",
                "method": "Email",
                "result": "Payment Reminder Sent",
            },
        ],
        "bank_details": {
            "bank_name": "BRB bank",
            "branch_name": "Main Branch",
            "branch_code": "001",
            "contact_number": "+888 55 44",
        },
    },
]

mdx_user_data_history = [
    {
        "patient_info": {
            "patient_id": "P123456",
            "first_name": "John",
            "last_name": "Doe",
            "date_of_birth": "1985-04-15",
            "gender": "Male",
            "contact_details": {
                "phone_number": "+1-555-123-4567",
                "email": "johndoe@example.com",
                "address": {
                    "street": "123 Elm St.",
                    "city": "Springfield",
                    "state": "IL",
                    "zip_code": "62704",
                    "country": "USA",
                },
            },
            "emergency_contact": {
                "name": "Jane Doe",
                "relationship": "Wife",
                "phone_number": "+1-555-987-6543",
            },
        },
        "medical_history": {
            "allergies": [
                {"name": "Penicillin", "reaction": "Rash", "severity": "Moderate"},
                {"name": "Peanuts", "reaction": "Anaphylaxis", "severity": "Severe"},
            ],
            "current_medications": [
                {"name": "Lisinopril", "dosage": "10 mg", "frequency": "Once daily"},
                {"name": "Metformin", "dosage": "500 mg", "frequency": "Twice daily"},
            ],
            "past_medical_conditions": [
                {
                    "condition": "Hypertension",
                    "diagnosed_date": "2015-06-20",
                    "status": "Controlled",
                },
                {
                    "condition": "Type 2 Diabetes",
                    "diagnosed_date": "2018-09-15",
                    "status": "Ongoing",
                },
            ],
            "surgical_history": [
                {
                    "procedure": "Appendectomy",
                    "date": "2005-11-10",
                    "outcome": "Successful",
                }
            ],
            "family_history": {
                "conditions": [
                    {
                        "condition": "Heart Disease",
                        "relation": "Father",
                        "age_at_diagnosis": 55,
                    },
                    {
                        "condition": "Breast Cancer",
                        "relation": "Mother",
                        "age_at_diagnosis": 60,
                    },
                ]
            },
            "social_history": {
                "smoking_status": "Former smoker",
                "alcohol_use": "Occasional",
                "exercise": "Moderate, 3 times a week",
            },
            "immunizations": [
                {"vaccine": "Influenza", "date": "2023-10-01"},
                {"vaccine": "COVID-19 Booster", "date": "2024-02-15"},
            ],
            "last_visit": {
                "date": "2024-09-05",
                "reason": "Routine check-up",
                "notes": "Patient is doing well, advised to continue current medication regimen.",
            },
        },
    },
    {
        "patient_info": {
            "patient_id": "P789012",
            "first_name": "Emily",
            "last_name": "Smith",
            "date_of_birth": "1992-12-03",
            "gender": "Female",
            "contact_details": {
                "phone_number": "+1-555-234-5678",
                "email": "emilysmith@example.com",
                "address": {
                    "street": "456 Oak St.",
                    "city": "Riverton",
                    "state": "CA",
                    "zip_code": "90210",
                    "country": "USA",
                },
            },
            "emergency_contact": {
                "name": "Michael Smith",
                "relationship": "Brother",
                "phone_number": "+1-555-876-5432",
            },
        },
        "medical_history": {
            "allergies": [
                {"name": "Shellfish", "reaction": "Hives", "severity": "Mild"}
            ],
            "current_medications": [
                {"name": "Atorvastatin", "dosage": "20 mg", "frequency": "Once daily"}
            ],
            "past_medical_conditions": [
                {
                    "condition": "Asthma",
                    "diagnosed_date": "2000-03-22",
                    "status": "Controlled with inhaler",
                },
                {
                    "condition": "Migraine",
                    "diagnosed_date": "2015-05-18",
                    "status": "Occasional",
                },
            ],
            "surgical_history": [
                {
                    "procedure": "Tonsillectomy",
                    "date": "2008-08-14",
                    "outcome": "Successful",
                }
            ],
            "family_history": {
                "conditions": [
                    {
                        "condition": "Hypertension",
                        "relation": "Mother",
                        "age_at_diagnosis": 50,
                    }
                ]
            },
            "social_history": {
                "smoking_status": "Never smoker",
                "alcohol_use": "Social drinker",
                "exercise": "Regular, 5 times a week",
            },
            "immunizations": [{"vaccine": "HPV", "date": "2010-07-10"}],
            "last_visit": {
                "date": "2024-08-20",
                "reason": "Asthma management",
                "notes": "Inhaler usage reviewed; condition stable.",
            },
        },
    },
    {
        "patient_info": {
            "patient_id": "P345678",
            "first_name": "David",
            "last_name": "Johnson",
            "date_of_birth": "1978-01-25",
            "gender": "Male",
            "contact_details": {
                "phone_number": "+1-555-345-6789",
                "email": "davidjohnson@example.com",
                "address": {
                    "street": "789 Pine St.",
                    "city": "Lakewood",
                    "state": "TX",
                    "zip_code": "77001",
                    "country": "USA",
                },
            },
            "emergency_contact": {
                "name": "Sarah Johnson",
                "relationship": "Wife",
                "phone_number": "+1-555-654-3210",
            },
        },
        "medical_history": {
            "allergies": [
                {
                    "name": "Latex",
                    "reaction": "Contact Dermatitis",
                    "severity": "Moderate",
                }
            ],
            "current_medications": [
                {"name": "Omeprazole", "dosage": "20 mg", "frequency": "Once daily"}
            ],
            "past_medical_conditions": [
                {
                    "condition": "GERD",
                    "diagnosed_date": "2010-12-11",
                    "status": "Managed with medication",
                },
                {
                    "condition": "High Cholesterol",
                    "diagnosed_date": "2016-07-24",
                    "status": "Under control",
                },
            ],
            "surgical_history": [
                {
                    "procedure": "Knee Arthroscopy",
                    "date": "2019-04-10",
                    "outcome": "Recovery ongoing, physical therapy recommended",
                }
            ],
            "family_history": {
                "conditions": [
                    {
                        "condition": "Diabetes",
                        "relation": "Mother",
                        "age_at_diagnosis": 45,
                    },
                    {
                        "condition": "Stroke",
                        "relation": "Father",
                        "age_at_diagnosis": 70,
                    },
                ]
            },
            "social_history": {
                "smoking_status": "Never smoker",
                "alcohol_use": "Moderate",
                "exercise": "Light, 2 times a week",
            },
            "immunizations": [{"vaccine": "Tetanus", "date": "2022-03-18"}],
            "last_visit": {
                "date": "2024-09-10",
                "reason": "Follow-up for GERD",
                "notes": "Patient reports improved symptoms with current medication.",
            },
        },
    },
]


def get_medx_user_data(id):
    if id > len(mdx_user_data_history) - 1:
        return mdx_user_data_history[0]
    return mdx_user_data_history[id]
