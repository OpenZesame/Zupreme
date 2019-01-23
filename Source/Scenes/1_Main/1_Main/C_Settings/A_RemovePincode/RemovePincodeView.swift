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

import UIKit
import RxSwift

private typealias € = L10n.Scene.RemovePincode

final class RemovePincodeView: ScrollableStackViewOwner {

    private lazy var inputPincodeView = InputPincodeView()

    lazy var stackViewStyle: UIStackView.Style = [
        inputPincodeView,
        .spacer
    ]

    override func setup() {
        inputPincodeView.becomeFirstResponder()
    }
}

extension RemovePincodeView: ViewModelled {
    typealias ViewModel = RemovePincodeViewModel

    func populate(with viewModel: ViewModel.Output) -> [Disposable] {
        return [
            viewModel.inputBecomeFirstResponder --> inputPincodeView.rx.becomeFirstResponder,
            viewModel.pincodeValidation         --> inputPincodeView.rx.validation
        ]
    }

    var inputFromView: InputFromView {
        return InputFromView(
            pincode: inputPincodeView.rx.pincode.asDriver()
        )
    }
}
