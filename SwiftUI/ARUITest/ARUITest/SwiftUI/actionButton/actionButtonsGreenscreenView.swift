//
//  GSBasicActionButton.swift
//  ARUITest
//
//  Created by Peter Pohlmann on 07.09.19.
//  Copyright © 2019 Peter Pohlmann. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct actionButtonsGreenscreenView: View {
  @EnvironmentObject var navController: NavController
  
  var body: some View {
    let buttonAddBasepoints = ButtonView(buttonAction:$navController.buttonAddBasepointsGreenscreen)
    let buttonSetHeight = ButtonView(buttonAction:$navController.buttonSetHeightGreenscreen)
    let buttonNextToHeight = ButtonView(buttonAction:$navController.buttonNextSetHeightGreenscreen)
    let buttonNextToMaterial = ButtonView(buttonAction:$navController.buttonNextMaterialGreenscreen)
    //let spacerButton = ButtonView(buttonAction:$navController.buttonSpacer)
    //let offset: CGFloat = 50
    
    let widthDelta = CGFloat(navController.buttonAddBasepointsGreenscreen.buttonWidth/2)
    
    return GeometryReader { geometry in

           HStack {
             buttonAddBasepoints
              .background(Color.green)
              Spacer(minLength: 30)
             buttonNextToHeight
              Spacer(minLength: 30)
             buttonSetHeight
            Spacer(minLength: 30)
             buttonNextToMaterial
           }
           .position(x: geometry.size.width - 10 + self.navController.buttonsGreenscreenOffsetX, y: 80)
           .animation(.easeInOut(duration: 0.4))
           .background(Color.green)
           .frame(maxWidth: .infinity)

     
    }

  }
}

struct GSBasicActionButton_Previews: PreviewProvider {
  static var previews: some View {
 
    Group {
      actionButtonsGreenscreenView().environmentObject(NavController())
        .previewDevice(PreviewDevice(rawValue: "iPhone X"))
        .previewDisplayName("iPhone X")
      
    }
    
  }
}
