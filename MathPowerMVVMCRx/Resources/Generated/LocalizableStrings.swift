// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L {

  internal enum Difficulty {
    /// Easy
    internal static let easy = L.tr("Localizable", "difficulty.easy")
    /// Hard
    internal static let hard = L.tr("Localizable", "difficulty.hard")
    /// Medium
    internal static let medium = L.tr("Localizable", "difficulty.medium")
  }

  internal enum Game {
    /// Game
    internal static let title = L.tr("Localizable", "game.title")
  }

  internal enum Menu {
    /// Math Power
    internal static let logoTitle = L.tr("Localizable", "menu.logo_title")
    /// Scoreboard
    internal static let scoreboardTitle = L.tr("Localizable", "menu.scoreboard_title")
    /// Start Game
    internal static let startGameTitle = L.tr("Localizable", "menu.start_game_title")
    /// Menu
    internal static let title = L.tr("Localizable", "menu.title")
  }

  internal enum Scoreboard {
    /// Scoreboard
    internal static let title = L.tr("Localizable", "scoreboard.title")
  }

  internal enum StartGame {
    /// Choose game difficulty?
    internal static let difficultyCaptionLabelText = L.tr("Localizable", "start_game.difficulty_caption_label_text")
    /// What's your name?
    internal static let nameCaptionLabelText = L.tr("Localizable", "start_game.name_caption_label_text")
    /// Name
    internal static let nameLabelPlaceholderText = L.tr("Localizable", "start_game.name_label_placeholder_text")
    /// Start Game
    internal static let startButtonText = L.tr("Localizable", "start_game.start_button_text")
    /// Start Game
    internal static let title = L.tr("Localizable", "start_game.title")
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
