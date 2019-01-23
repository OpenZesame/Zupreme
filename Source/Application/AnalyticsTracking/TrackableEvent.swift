//
// Copyright 2019 Open Zesame
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under thexc License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

/// Trackable event, most likely user interaction, i.e, button tap.
protocol TrackableEvent {
    var eventName: String { get }
    var eventContext: String { get }
}

extension TrackableEvent where Self: RawRepresentable, Self.RawValue == String {
    var eventName: String {
        return rawValue
    }
}

// MARK: Default Implemtation for `enum` that do not have RawTypes, using reflection
extension TrackableEvent {
    var eventContext: String {
        return String(describing: type(of: self))
    }
}

