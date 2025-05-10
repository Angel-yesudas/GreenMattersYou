//
//  HelpCenterView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/02/25.
//

import SwiftUI

struct HelpCenterView: View {
    var body: some View {
        
            
                VStack {
                    Text("For any assistance, contact us at:")
                        .font(.body)
                        .padding()
                    
                    Text("📧 support@greenmatters.com")
                    Text("📞 +91 98765 43210")
                    
                    Spacer()
                }
                .navigationTitle("Help Center")
                .padding()
            }
        }

        #Preview {
            HelpCenterView()
        }

  
#Preview {
    HelpCenterView()
}
