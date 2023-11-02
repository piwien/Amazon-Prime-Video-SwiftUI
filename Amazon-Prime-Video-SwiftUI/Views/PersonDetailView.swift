//
//  PersonDetailView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 27.10.2023.
//

//
//  PersonDetailView.swift
//  Amazon-Prime-Video-SwiftUI
//
//  Created by Berkay Yaşar on 27.10.2023.
//

import SwiftUI

struct PersonDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var model = ContentDetailViewModel()
    let cast: CastProfile?
    
    var body: some View {
            ZStack(alignment: .top) {
                Color(.black)
                VStack(spacing: 0) {
                    HStack {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.primary)
                                .bold()
                        })
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    ScrollView(showsIndicators: false) {
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: cast?.photoUrl) { image in
                                image
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            LinearGradient(
                                gradient: Gradient(
                                    stops: [
                                        .init(color: Color.black.opacity(0.0), location: 0),
                                        .init(color: Color.black.opacity(0.5), location: 0.5),
                                        .init(color: Color.black.opacity(0.9), location: 1)
                                    ]
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 200, alignment: .top)
                            
                            VStack{
                                Text(cast?.name ?? "ERROR NAME DATA")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .bold()
                                Spacer().frame(height: 45)
                            }
                        }
                        VStack(spacing: 0){
                            Spacer().frame(height: 10)
                            HStack {
                                Text("Biography")
                                    .bold()
                                    .font(.title2)
                                    .italic()
                                    .underline()
                                Spacer()
                            }.padding(.horizontal,30)
                            Spacer().frame(height: 10)
                            ScrollView {
                                Text(cast?.biography ?? "Error Bio Data")
                            }
                        }
                        .frame(height: 400)
                        .padding(.horizontal)
                    }
                    
                }
            }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    PersonDetailView( cast: .init(birthday: "12.05.2000", id: 10, name: "Berkay Caprio", profile_path: "/hHP0769L7YrApkMKCOyb9cwgxBW.jpg", biography: "Gary Leonard Oldman (born 21 March 1958) is an English actor and filmmaker. Regarded as one of the best actors of his generation, he is known for his versatility and intense acting style. He received various accolades, including an Academy Award, a Golden Globe Award, a Screen Actors Guild Award, and three British Academy Film Awards. His films have grossed over $11 billion worldwide, making him one of the highest-grossing actors to date.\n\nOldman began acting in theatre in 1979 and made his film debut in Remembrance (1982). He continued to follow a stage career in London's Royal Court and was a member of the Royal Shakespeare Company, with credits including Cabaret, Romeo and Juliet, Entertaining Mr Sloane, Saved, The Country Wife and Hamlet. He rose to prominence in British film with his portrayals of Sid Vicious in Sid and Nancy (1986), Joe Orton in Prick Up Your Ears (1987) and Rosencrantz in Rosencrantz & Guildenstern Are Dead (1990), while also attracting attention as the leader of a gang of football hooligans in the television film The Firm (1989). Regarded as a member of the \"Brit Pack\", he achieved greater recognition as a New York gangster in State of Grace (1990), Lee Harvey Oswald in JFK (1991) and Count Dracula in Bram Stoker's Dracula (1992).\n\nOldman portrayed the villains in films such as True Romance (1993), The Fifth Element (1997), Air Force One (1997) and The Contender (2000); corrupt DEA agent Norman Stansfield, whom he played in Léon: The Professional (1994), was called one of cinema's best villains. He also played Ludwig van Beethoven in Immortal Beloved (1994) and later appeared in franchise roles such as Sirius Black in the Harry Potter series, James Gordon in The Dark Knight Trilogy (2005–2012) and a human leader, Dreyfus in Dawn of the Planet of the Apes (2014). He won the Academy Award for Best Actor for his role as Winston Churchill in Darkest Hour (2017), and was nominated for his portrayals of George Smiley in Tinker Tailor Soldier Spy (2011) and Herman J. Mankiewicz in Mank (2020).\n\nOldman was executive producer of films like The Contender, Plunkett & Macleane (1999) and Nil by Mouth (1997), the latter of which he also wrote and directed. He featured in television shows such as Fallen Angels, Tracey Takes On... and Friends, voiced Ignitius and Viktor Reznov respectively in The Legend of Spyro and Call of Duty video games and appeared in music videos for David Bowie, Guns N' Roses and Annie Lennox.", known_for_department: "Actor", place_of_birth: "New Cross, London, England, UK"))
}
