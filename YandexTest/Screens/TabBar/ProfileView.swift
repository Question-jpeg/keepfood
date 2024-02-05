//
//  ProfileView.swift
//  YandexTest
//
//  Created by Игорь Михайлов on 30.01.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "pencil")
                    .foregroundStyle(.accentOrange)
                    .font(.title2)
                    .fontWeight(.black)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Spacer()
                
                Button(role: .destructive) {
                    
                } label: {
                    Text("Выйти")
                }
            }
            .padding(.horizontal, 30)
            
                Image(.avatar)
                .padding(.bottom, 10)
                
                Text("Иван Димитров")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("keepfoód")
                        .font(.system(size: 26).bold())
                    
                    Text("family")
                        .fontWeight(.semibold)
                        .foregroundStyle(.accentOrange)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(.white)
                        .clipShape(Capsule())
                }
                
                Text("Испытайте все преимущества сервиса с подпиской Keepfoód family")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                HStack(alignment: .bottom, spacing: 5) {
                    Text("349,00₽")
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("/мес")
                        .fontWeight(.semibold)
                }
            }
            .foregroundStyle(.white)
            .padding()
            .background(
                Color.accentOrange
                    .overlay {
                        LinearGradient(gradient: .init(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white.opacity(0.5), location: 1)
                        ]), startPoint: .leading, endPoint: .trailing)
                    }
            )
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            VStack(spacing: 15) {
                NavCell(image: Image(.setting), title: "Настройки")
                NavCell(image: Image(.alisa), title: "Яндекс.Алиса")
                NavCell(image: Image(.heart), title: "Избранное")
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    ProfileView()
}

struct NavCell: View {
    let image: Image
    let title: String
    
    var body: some View {
        HStack {
            image
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.trailing, 20)
            
            Text(title)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}
