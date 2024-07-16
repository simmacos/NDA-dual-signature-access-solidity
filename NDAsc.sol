// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartLegalContract {
    // Indirizzi dei firmatari richiesti
    address public requiredSigner1;
    address public requiredSigner2;

    // Mapping per tenere traccia delle firme
    mapping(address => bool) private hasSigned;

    // Evento emesso quando un firmatario firma
    event SignerSigned(address indexed signer);

    // URL della risorsa
    string private resourceUrl;

    // Costruttore per impostare gli indirizzi dei firmatari richiesti e l'URL della risorsa
    constructor(address _requiredSigner1, address _requiredSigner2, string memory _resourceUrl) {
        requiredSigner1 = _requiredSigner1;
        requiredSigner2 = _requiredSigner2;
        resourceUrl = _resourceUrl;
    }

    // Funzione per firmare lo smart contract
    function sign() external {
        require(msg.sender == requiredSigner1 || msg.sender == requiredSigner2, "Unauthorized signer");
        require(!hasSigned[msg.sender], "Signer already signed");

        hasSigned[msg.sender] = true;
        emit SignerSigned(msg.sender);
    }

    // Funzione per verificare se entrambi i firmatari hanno firmato
    function haveRequiredSignersSigned() public view returns (bool) {
        return hasSigned[requiredSigner1] && hasSigned[requiredSigner2];
    }

    // Funzione per accedere alla risorsa (solo se entrambi i firmatari hanno firmato)
    function accessResource() external view returns (string memory) {
        require(haveRequiredSignersSigned(), "Required signers have not signed");
        
        // Restituisce l'URL della risorsa
        return resourceUrl;
    }
}