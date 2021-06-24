//
//  ThemeChooser.swift
//  Memorize
//
//  Created by Sergey Blednov on 6/24/21.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var store: ThemeStore
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
//                    NavigationLink(destination: PaletteEditor(palette: $store.palettes[palette])) {
                        VStack(alignment: .leading) {
                            let color = Color(rgbaColor: theme.color)
                            Text(theme.name).font(.title2).foregroundColor(color)
                            Text("All of " + theme.emojis)
                                .font(.callout)
                                .lineLimit(1)
                        }
//                    }
                }
                .onDelete { indexSet in
//                    store.theme.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, newOffset in
//                    store.theme.move(fromOffsets: indexSet, toOffset: newOffset)
                }
            }
            .navigationTitle("Memorize")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if presentationMode.wrappedValue.isPresented,
                       UIDevice.current.userInterfaceIdiom != .pad {
                        Button("+") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                ToolbarItem { EditButton() }
            }
            .environment(\.editMode, $editMode)
        }
    }
}

struct ThemeChooserView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChooser()
            .environmentObject(ThemeStore(named: "Preview"))
            .previewDevice("iPhone 12 mini")
    }
}
