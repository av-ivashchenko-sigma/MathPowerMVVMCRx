// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L {

  internal enum Menu {
    /// Math Power
    internal static let logoTitle = L.tr("Localizable", "menu.logo_title")
    /// Scoreboard
    internal static let scoreboardTitle = L.tr("Localizable", "menu.scoreboard_title")
    /// Start Game
    internal static let startGameTitle = L.tr("Localizable", "menu.start_game_title")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
