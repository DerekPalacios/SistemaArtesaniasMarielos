using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;

using SistemaArtesaniasMarielos.Data.Context;
using SistemaArtesaniasMarielos.Data.Service;
using BlazorStrap;
using CurrieTechnologies.Razor.SweetAlert2;
using Sotsera.Blazor.Toaster.Core.Models;
using SistemaArtesaniasMarielos.Data.Providers;
using Microsoft.AspNetCore.Components.Authorization;
using Blazored.LocalStorage;

namespace SistemaArtesaniasMarielos
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRazorPages();
            services.AddServerSideBlazor();

            services.AddDbContext<ArtesaniasVentasArticulosComprasContext>(options =>
                    options.UseSqlServer(Configuration.GetConnectionString(name: "ArtesaniasVentasArticulosComprasContext")),
                       ServiceLifetime.Transient);

            services.AddTransient<ArtesaniasVentasArticulosComprasContext>();
            services.AddTransient<CompraService>();
            services.AddTransient<VentaService>();
            services.AddTransient<CatalogosCaracteristicasDetalles>();
            services.AddTransient<ConfiguracionService>();
            services.AddTransient<ProveedorService>();
            services.AddTransient<ClienteService>();
            services.AddTransient<UsuariosService>();
            services.AddTransient<LoginService>();
            services.AddTransient<RolesService>();
            services.AddTransient<CatalogoService>();
            services.AddTransient<VisualizacionService>();
            services.AddBootstrapCss();

            services.AddTransient<AuthProvider>();
            services.AddTransient<AuthenticationStateProvider, MiAuthenticationState>();

            //Terceros
            services.AddSweetAlert2();
            services.AddBlazoredLocalStorage();

            // Add the library to the DI system
            services.AddToaster(config =>
            {
                //example customizations
                config.PositionClass = Defaults.Classes.Position.TopCenter;
                config.PreventDuplicates = true;
                config.NewestOnTop = false;
            });
        }

        // This method gets called by th. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapBlazorHub();
                endpoints.MapFallbackToPage("/_Host");
            });
        }
    }
}
