import Foundation
import ScreenCaptureKit

// Project Requirements:
/*
   - Configure screen to be recorded
   - Init screen recording
   - Start screen recording
   - Pause screen recording
   - Stop screen recording
*/

func main() {
    guard #available(macOS 12.3, *) else {
        print("Invalid macOS version")
        return
    }
    
    SCShareableContent.getExcludingDesktopWindows(false, onScreenWindowsOnly: false, completionHandler: {content, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        guard let content = content else {
            print("No shareable content returned.")
            return
        }

        print("Displays:")
        for display in content.displays {
            print("- \(display.displayID): \(display.width)x\(display.height)")
        }

        print("Windows:")
        for window in content.windows {
            print("- \(window.windowID): \(window.owningApplication?.applicationName ?? "Unknown")")
        }
    })
    
    RunLoop.main.run(until: Date().addingTimeInterval(10))
}


func initRecording() {}

func startRecording() {}

func stopRecording() {}

main()
