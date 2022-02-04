using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using SistemaArtesaniasMarielos.Data.Sub_Models;

namespace SistemaArtesaniasMarielos.Data.Providers
{
    public class MiAuthenticationState : AuthenticationStateProvider
    {

        private readonly ILocalStorageService localStorage;
        public MiAuthenticationState(ILocalStorageService localStorage)
        {
            this.localStorage = localStorage;
        }
        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var token = await localStorage.GetItemAsync<LoginModel>(key: "token");

            if (token==null)
            {
                return new AuthenticationState(user: new ClaimsPrincipal(identity: new ClaimsIdentity()));
            }

            if (string.IsNullOrEmpty(token.Usuario))
            {
                return new AuthenticationState(user: new ClaimsPrincipal(identity: new ClaimsIdentity()));
            }

            var usuarioAutenticado = SignIn(token);
            return new AuthenticationState(usuarioAutenticado);
        }


        public ClaimsPrincipal SignIn(LoginModel token)
        {
            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.Name, token.Usuario),
                

            };

            var identity = new ClaimsIdentity(claims, authenticationType: "artesanias");

            var principal = new ClaimsPrincipal(identity);
            var authState = Task.FromResult(new AuthenticationState(principal));
            NotifyAuthenticationStateChanged(authState);
            return principal;
        }



        public void SingOut()
        {
            var usuarioAnonimo = new ClaimsPrincipal(identity: new ClaimsIdentity());
            var authState = Task.FromResult(new AuthenticationState(usuarioAnonimo));
            NotifyAuthenticationStateChanged(authState);
        }
    }
}
