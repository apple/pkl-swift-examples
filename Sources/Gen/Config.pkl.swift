// Code generated from Pkl module `Config`. DO NOT EDIT.
import PklSwift

public enum Config {}

extension Config {
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "Config"

        /// The address the server will accept connections on
        public var hostname: String

        /// The port the server will accept connections on
        public var port: Int

        /// Whether the server will attempt to minimize TCP packet delay
        public var tcpNoDelay: Bool

        /// Maximum length of the pending connections queue
        public var backlog: Int

        /// The `Server` header on outgoing HTTP reponses
        public var serverName: String?

        public init(
            hostname: String,
            port: Int,
            tcpNoDelay: Bool,
            backlog: Int,
            serverName: String?
        ) {
            self.hostname = hostname
            self.port = port
            self.tcpNoDelay = tcpNoDelay
            self.backlog = backlog
            self.serverName = serverName
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `Config.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> Config.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `Config.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> Config.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}