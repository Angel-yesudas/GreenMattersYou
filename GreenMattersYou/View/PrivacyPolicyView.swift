//
//  PrivacyPolicyView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Privacy Policy")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Effective Date: [10/01/2024]\nLast Updated: [25/11/2025]")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Welcome to Haritha Keralam! Your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our application.")
                
                Divider()
                
                Text("1. Information We Collect")
                    .font(.headline)
                
                Text("We collect the following types of data to provide and improve our services:")
                
                Text("• **Personal Information**\n   - Name\n   - Email Address\n   - Phone Number\n   - Address")
                
                Text("• **Usage Data**\n   - App interactions (features you use, frequency of visits)\n   - Device information (OS version, device type)\n   - IP Address")
                
                Text("• **Payment Information**\n   - UPI IDs (for processing payments via Razorpay)\n   - Transaction details (only for verification, not stored permanently)")
                
                Divider()
                
                Text("2. How We Use Your Information")
                    .font(.headline)
                
                Text("""
                - **To provide services:** Manage user accounts, process transactions, and enable payments.
                - **To improve user experience:** Personalize app features based on usage patterns.
                - **For security & fraud prevention:** Monitor transactions for suspicious activity.
                - **For customer support:** Respond to queries and assist users.
                """)
                
                Divider()
                
                Text("3. How We Share Your Information")
                    .font(.headline)
                
                Text("""
                We do not sell your personal data. However, we may share information with:
                - **Third-party payment gateways (e.g., Razorpay)** to process payments.
                - **Legal authorities** when required by law or to prevent fraud.
                """)

                Divider()
                
                Text("4. Data Protection & Security")
                    .font(.headline)
                
                Text("""
                We implement strong security measures to protect your personal data:
                - **Encryption** for sensitive data transmission.
                - **Secure servers** to store user information.
                - **Access control** to prevent unauthorized data usage.
                
                However, while we take precautions, no method of transmission over the internet is 100% secure.
                """)
                
                Divider()
                
                Text("5. Your Rights & Choices")
                    .font(.headline)
                
                Text("""
                You have the right to:
                ✅ Access and review your personal information.
                ✅ Request correction or deletion of your data.
                ✅ Opt-out of promotional communications.

                To exercise these rights, contact us at **support@harithakeralam.com**.
                """)
                
                Divider()
                
                Text("6. Changes to This Policy")
                    .font(.headline)
                
                Text("We may update this Privacy Policy periodically. Any changes will be posted here with a revised effective date.")

                Divider()
                
                Text("7. Contact Us")
                    .font(.headline)
                
                Text("""
                For questions regarding this Privacy Policy, contact:
                📧 **Email:** support@harithakeralam.com  
                📍 **Address:** [Company Address]
                """)
            }
            .padding()
        }
        .navigationTitle("Privacy Policy")
    }
}

#Preview {
    PrivacyPolicyView()
}
